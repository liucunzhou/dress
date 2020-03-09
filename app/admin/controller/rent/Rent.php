<?php
declare (strict_types=1);

namespace app\admin\controller\rent;

use app\admin\controller\Backend;
use app\admin\model\Payment;
use app\admin\model\RentGoods;
use think\facade\View;
use think\helper\Str;
use think\Request;

class Rent extends Backend
{
    protected $payments = [];
    protected $paytypes = [];
    protected $dressModel;
    protected $packageModel;
    protected $rentPaymentModel;
    protected $rentGoods;

    public function __construct(Request $request)
    {
        parent::__construct($request);

        $paymentModel = new Payment();
        $this->payments = $paymentModel->column('id,title,weigh');
        View::assign('payments', $this->payments);

        $paytypes = [
            'full' => '全款',
            'earnest'   => '定金',
            'tail' => '尾款'
        ];
        View::assign('paytypes', $paytypes);

        $statusText = [
            'init'      => '已支付，待取件',
            'fetch'     => '已取件，待还件',
            'return'    => '已还件, 待清洗',
            'wash'      => '已清洗, 待归档',
            'restore'   => '已完成'
        ];
        View::assign('statusText', $statusText);


        $this->model = new \app\admin\model\Rent();
        $this->dressModel = new \app\admin\model\Dress();
        $this->packageModel = new \app\admin\model\Package();
        $this->rentPaymentModel = new \app\admin\model\RentPayment();
        $this->rentGoods = new RentGoods();

        $users = [];
        View::assign('users', $users);
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);

        return View::fetch();
    }

    public function create()
    {
        // 直接生成订单号
        $orderNo = date('YmdHis') . Str::random(4, 1);
        View::assign('orderNo', $orderNo);
        return parent::create();
    }

    public function edit($id)
    {
        $where['rent_id'] = $id;
        $result = $this->rentGoods->where($where)->select();
        $goodsList = [];
        foreach ($result as $key => $value) {
            $map = [];
            if($value->goods_type == 'dress') {
                $map['id'] = $value->goods_id;
                $row = $this->dressModel->where($map)->find()->getData();
                $row['type'] = 'dress';
            } else {
                $map['id'] = $value->goods_id;
                $row = $this->packageModel->where($map)->find()->getData();
                $row['type'] = 'package';
            }
            $goodsList[] = $row;
        }
        View::assign('goodsList', $goodsList);

        $payList = $this->rentPaymentModel->where($where)->select();
        View::assign('payList', $payList);
        return parent::edit($id);
    }

    public function doCreate()
    {
        $params = $this->request->param();
        $this->model->startTrans();
        $result1 = $this->model->save($params['row']);
        $rentId = $this->model->id;

        // 订单商品列表
        $data = [];
        if (isset($params['dress']) && !empty($params)) {
            foreach ($params['dress'] as $row) {
                $data[] = [
                    'rent_id' => $rentId,
                    'goods_type' => 'dress',
                    'goods_id' => $row
                ];
            }
        }

        // 订单套餐列表
        if (isset($params['package']) && !empty($params)) {
            foreach ($params['package'] as $row) {
                $data[] = [
                    'rent_id' => $rentId,
                    'goods_type' => 'dress',
                    'goods_id' => $row
                ];
            }
        }

        if (!empty($data)) {
            $result2 = $this->rentGoods->insertAll($data);
        } else {
            $arr = [
                'code' => '500',
                'msg' => '请添加商品'
            ];

            return json($arr);
        }

        // 生成支付日志
        $params['row']['rent_id'] = $rentId;
        $result3 = $this->rentPaymentModel->save($params['row']);


        if ($result1 && $result2 && $result3) {
            $this->model->commit();
            $arr = [
                'code' => '200',
                'redirect' => $params['redirect'],
                'msg' => '添加成功',
            ];
        } else {
            $this->model->rollback();
            $arr = [
                'code' => '500',
                'msg' => '添加失败',
            ];
        }

        return json($arr);
    }

    public function doEdit()
    {
        $params = $this->request->param();
        $this->model->startTrans();

        // 保存订单的基本信息、如补全用的信息、备注信息、添加或删除商品后的订单价格等等
        $where['id'] = $params['row']['id'];
        $order = $this->model->where($where)->find();
        $result1 = $order->save($params['row']);
        $rentId = $order->id;

        // 添加商品通过ajax处理、这里添加商品只修改订单价格

        // 生成支付日志
        if($params['row']['pay_money']) {
            $params['row']['rent_id'] = $rentId;
            $result3 = $this->rentPaymentModel->save($params['row']);
        }


        if ($result1) {
            $this->model->commit();
            $arr = [
                'code' => '200',
                'redirect' => $params['redirect'],
                'msg' => '修改订单成功',
            ];
        } else {
            $this->model->rollback();
            $arr = [
                'code' => '500',
                'msg' => '修改订单失败',
            ];
        }

        return json($arr);
    }

    /**
     * 编辑状态下————移除商品
     * 1、删除商品后是否直接修改订单价格
     */
    public function removeGoods()
    {
        $params = $this->request->param();

        $this->rentGoods->startTrans();
        $where['rent_id'] = $params['rent_id'];
        $where['goods_id'] = $params['goods_id'];
        $where['goods_type'] = $params['goods_type'];
        $orderGoods = $this->rentGoods->where($where)->find();
        // 1、查找商品信息

        // 2、从订单商品列表中删除
        $result = $orderGoods->delete();

        // 3、修改商品总价

        if($result) {
            $this->rentGoods->commit();
            $arr = [
                'code'  => '200',
                'msg'   => '删除成功'
            ];
        } else {
            $this->rentGoods->rollback();
            $arr = [
                'code'  => '500',
                'msg'   => '删除成功'
            ];
        }

        return json($arr);
    }

    /**
     * 查看订单情况
     */
    public function read($id)
    {
        $where['rent_id'] = $id;
        $result = $this->rentGoods->where($where)->select();
        $goodsList = [];
        foreach ($result as $key => $value) {
            $map = [];
            if($value->goods_type == 'dress') {
                $map['id'] = $value->goods_id;
                $row = $this->dressModel->where($map)->find()->getData();
                $row['type'] = 'dress';
            } else {
                $map['id'] = $value->goods_id;
                $row = $this->packageModel->where($map)->find()->getData();
                $row['type'] = 'package';
            }
            $goodsList[] = $row;
        }
        View::assign('goodsList', $goodsList);

        return View::fetch();
    }

    /**
     * 取件
     */
    public function take()
    {
        return View::fetch();
    }

    /**
     * 还件
     */
    public function back()
    {
        return View::fetch();
    }

    /**
     * 清洗
     */
    public function wash()
    {
        return View::fetch();
    }


    /**
     * 租赁排期
     *
     * @param  int $id
     * @return \think\Response
     */
    public function schedule()
    {
        return View::fetch();
    }
}

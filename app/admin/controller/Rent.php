<?php
declare (strict_types=1);

namespace app\admin\controller;

use app\admin\model\Payment;
use app\admin\model\RentGoods;
use think\facade\View;
use think\helper\Str;
use think\Request;

class Rent extends Backend
{
    protected $payments = [];
    protected $dressModel;
    protected $packageModel;
    protected $rentGoods;

    public function __construct(Request $request)
    {
        $paymentModel = new Payment();
        $this->payments = $paymentModel->column('id,title,weigh');
        View::assign('payments', $this->payments);

        $this->model = new \app\admin\model\Rent();

        $this->dressModel = new \app\admin\model\Dress();
        $this->packageModel = new \app\admin\model\Package();
        $this->rentGoods = new RentGoods();

        $users = [];
        View::assign('users', $users);
        parent::__construct($request);
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

        return parent::edit($id);
    }

    public function doCreate()
    {
        $params = $this->request->param();
        $this->model->startTrans();
        $this->model->order_no = date('YmdHis') . Str::random(4, 1);
        $result1 = $this->model->save($params['row']);
        $rentId = $this->model->id;

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

        if ($result1 && $result2) {
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

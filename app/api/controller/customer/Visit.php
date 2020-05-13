<?php
declare (strict_types = 1);

namespace app\api\controller\customer;
use app\api\controller\Api;
use think\Request;

class Visit extends Api
{
    protected $stores = [];
    protected $sources = [];
    protected $customer = '';
    protected $statuses = [
        '未回访',
        '跟进中',
        '有效',
        '无效'
    ];

    public function __construct(Request $request){
        parent::__construct($request);
        $params = $request->param();

        $this->model = new \app\admin\model\CustomerVisit();

        $customerModel = new \app\admin\model\Customer();
        $where['id'] = $params['customer_id'];
        $this->customer = $customerModel->where($where)->find();
        View::assign('customer', $this->customer);

        $storeModel = new \app\admin\model\Store();
        $this->stores = $storeModel->order('weigh desc')->column('id,title,weigh', 'id');
        View::assign('stores', $this->stores);

        $sourceModel = new \app\admin\model\Source();
        $this->sources =$sourceModel->order('weigh desc')->column('id,title,weigh', 'id');
        View::assign('sources', $this->sources);

        View::assign('statuses', $this->statuses);
    }

    public function create()
    {
        $params = $this->request->param();
        $where['customer_id'] = $params['customer_id'];
        $visits = $this->model->where($where)->order('createtime desc')->select();
        View::assign('visits', $visits);

        $userModel = new \app\admin\model\User();
        $users = $userModel->column('id,realname,nickname', 'id');
        View::assign('users', $users);

        return View::fetch();
    }

    public function doCreate()
    {
        $params = $this->request->param();
        $this->model->startTrans();
        $failMsg = '回访失败';
        $result1 = $this->model->save($params['row']);

        $this->customer->status = $params['row']['status'];
        $this->customer->visit_times = Db::raw('visit_times+1');
        $result2 = $this->customer->save();

        if ($result1 && $result2) {
            $this->model->commit();

            $arr = [
                'code'  => '200',
                'redirect' => $params['redirect'],
                'msg'   => '回访成功',
            ];
        } else {
            $this->model->rollback();

            $arr = [
                'code'  => '500',
                'msg'   => $failMsg,
            ];
        }

        return json($arr);
    }
}

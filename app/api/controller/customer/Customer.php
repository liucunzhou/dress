<?php
declare (strict_types = 1);

namespace app\api\controller\customer;

use app\api\controller\Api;
use think\Request;

class Customer extends Api
{
    protected $stores = [];
    protected $sources = [];

    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->validate = new \app\admin\validate\Customer();
        $this->model = new \app\admin\model\Customer();

        $storeModel = new \app\admin\model\Store();
        $this->stores = $storeModel->order('weigh desc')->column('id,title,weigh', 'id');

        $sourceModel = new \app\admin\model\Source();
        $this->sources =$sourceModel->order('weigh desc')->column('id,title,weigh', 'id');
    }

    public function index()
    {
        // $where['status'] = 'normal';
        $where = [];
        $rows = $this->model->where($where)->order('weigh desc')->paginate(10);

        return json($rows);
    }

    public function sea()
    {
        $where = [];
        // $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function promoter()
    {
        $where = [];
        // $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function allocate($id)
    {
        $userModel = new \app\admin\model\User();
        $dressers = $userModel->select();
        View::assign('dressers', $dressers);

        $row = $this->model->find($id);
        View::assign('data', $row);
        return View::fetch();
    }
}

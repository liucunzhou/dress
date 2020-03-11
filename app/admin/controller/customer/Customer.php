<?php
declare (strict_types = 1);

namespace app\admin\controller\customer;

use app\admin\controller\Backend;
use think\facade\View;
use think\Request;

class Customer extends Backend
{
    protected $stores = [];
    protected $sources = [];

    public function __construct(Request $request)
    {
        $this->validate = new \app\admin\validate\Customer();
        $this->model = new \app\admin\model\Customer();

        $storeModel = new \app\admin\model\Store();
        $this->stores = $storeModel->order('weigh desc')->column('id,title,weigh', 'id');
        View::assign('stores', $this->stores);

        $sourceModel = new \app\admin\model\Source();
        $this->sources =$sourceModel->order('weigh desc')->column('id,title,weigh', 'id');
        View::assign('sources', $this->sources);

        parent::__construct($request);
    }

    public function index()
    {
        // $where['status'] = 'normal';
        $where = [];
        $rows = $this->model->where($where)->order('weigh desc')->select();
        View::assign('rows', $rows);

        //
        return View::fetch();
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

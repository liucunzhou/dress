<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\facade\View;
use think\Request;

class Customer extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Customer();
        parent::__construct($request);
    }

    public function sea()
    {
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function today()
    {
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller\customer;

use app\admin\controller\Backend;
use think\facade\View;
use think\Request;

class Customer extends Backend
{
    protected $sources = [];

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Customer();

        $sourceModel = new \app\admin\model\Source();
        $this->sources =$sourceModel->order('weigh desc')->column('id,title,weigh', 'id');
        View::assign('sources', $this->sources);

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

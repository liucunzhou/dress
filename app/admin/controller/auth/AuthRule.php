<?php
declare (strict_types = 1);

namespace app\admin\controller\auth;

use app\admin\controller\Backend;
use think\facade\View;
use think\Request;

class AuthRule extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\AuthRule();
        parent::__construct($request);
    }

    /**
     * 显示资源列表
     * @return \think\Response
     */
    public function index()
    {
        $where = [];
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);

        return View::fetch();
    }
}

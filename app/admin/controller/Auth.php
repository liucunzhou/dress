<?php
declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\model\AuthRule;
use think\facade\View;
use think\Request;

class Auth extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new AuthRule();
        parent::__construct($request);
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $where = [];
        $where['status'] = 'normal';
        $rows = AuthRule::where($where)->select();
        View::assign('rows', $rows);

        return View::fetch();
    }
}

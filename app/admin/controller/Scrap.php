<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\facade\View;
use think\Request;

class Scrap extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Scrap();

        $users = [];
        View::assign('users', $users);
        parent::__construct($request);
    }
}

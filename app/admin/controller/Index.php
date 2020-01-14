<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\facade\View;

class Index extends Backend
{
    public function index()
    {
        return View::fetch();
    }
}

<?php
declare (strict_types = 1);

namespace app\home\controller;

use think\facade\View;

class Index
{
    public function index()
    {
        return redirect('/admin/passport/login');
    }

    public function teacher()
    {
        return View::fetch();
    }
}

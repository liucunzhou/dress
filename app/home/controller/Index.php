<?php
declare (strict_types = 1);

namespace app\home\controller;

class Index
{
    public function index()
    {
        return redirect('/admin.php?s=passport/login');
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\App;
use think\facade\View;
use think\Request;

class Base
{
    protected $loginUrl = '/admin/passport/login';
    protected $request;

    public function __construct(Request $request)
    {
        $this->request = $request;
        $viewPath =  App::getInstance()->getBasePath().'admin/template/';
        // $viewPath =  App::getInstance()->getBasePath().'admin/view/';
        View::config(['view_path' => $viewPath]);
    }
}

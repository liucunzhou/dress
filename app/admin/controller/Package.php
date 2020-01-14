<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Package extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Package();
        parent::__construct($request);
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Size extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Size();

        parent::__construct($request);
    }
}

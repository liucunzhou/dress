<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Supplier extends Backend
{

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Supplier();

        parent::__construct($request);
    }
}

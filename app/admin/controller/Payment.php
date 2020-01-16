<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Payment extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Payment();

        parent::__construct($request);
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Dress extends Backend
{

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Dress();
        parent::__construct($request);
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\Request;

class Color extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Color();

        parent::__construct($request);
    }
}

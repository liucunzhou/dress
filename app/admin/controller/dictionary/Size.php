<?php
declare (strict_types = 1);

namespace app\admin\controller\dictionary;

use app\admin\controller\Backend;
use think\Request;

class Size extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Size();

        parent::__construct($request);
    }
}

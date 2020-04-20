<?php
declare (strict_types = 1);

namespace app\admin\controller\organize;

use app\admin\controller\Backend;
use think\Request;

class Department extends Backend
{

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Department();
        parent::__construct($request);
    }
}

<?php
declare (strict_types = 1);

namespace app\admin\controller\dictionary;

use app\admin\controller\Backend;
use think\Request;

class Store extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Store();
        parent::__construct($request);
    }
}

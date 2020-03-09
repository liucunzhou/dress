<?php
declare (strict_types = 1);

namespace app\admin\controller\dictionary;

use app\admin\controller\Backend;
use think\Request;

class Source extends Backend
{
    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Source();
        parent::__construct($request);
    }
}

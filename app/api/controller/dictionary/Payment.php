<?php
namespace app\api\controller\dictionary;


use app\api\controller\Api;
use think\Request;

class Payment extends Api
{
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->model = new \app\admin\model\Payment();
    }
}
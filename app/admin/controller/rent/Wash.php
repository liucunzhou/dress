<?php
declare (strict_types = 1);

namespace app\admin\controller\rent;

use app\admin\controller\Backend;
use app\admin\model\RentWash;
use think\Request;

class Wash extends Backend
{
    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->model = new RentWash();
    }

    public function build()
    {

        return View::fetch();
    }

}

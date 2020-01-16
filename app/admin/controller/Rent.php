<?php
declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\model\Payment;
use think\facade\View;
use think\Request;

class Rent extends Backend
{
    protected $payments = [];


    public function __construct(Request $request)
    {
        $paymentModel = new Payment();
        $this->payments = $paymentModel->column('id,title,weigh');
        View::assign('payments', $this->payments);

        $this->model = new \app\admin\model\Rent();

        $users = [];
        View::assign('users', $users);
        parent::__construct($request);
    }

    /**
     * 显示资源列表
     *
     * @return \think\Response
     */
    public function index()
    {
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function doCreate()
    {

    }

    /**
     * 租赁排期
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function schedule()
    {
        return View::fetch();
    }
}

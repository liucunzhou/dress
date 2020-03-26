<?php
declare (strict_types = 1);

namespace app\admin\controller\sale;

use app\admin\controller\Backend;
use app\admin\model\SaleFetch;
use think\facade\View;
use think\Request;

class Fetch extends Backend
{
    protected $saleModel;
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->model = new SaleFetch();

        $this->saleModel = new \app\admin\model\Sale();
    }

    public function build()
    {
        $params = $this->request->param();

        $where = [];
        $where['id'] = $params['sale_id'];
        $sale = $this->saleModel->where($where)->find();
        View::assign('sale', $sale);

        $where = [];
        $where['sale_id'] = $params['sale_id'];
        $take = $this->model->where($where)->find();
        if(!empty($take)) {
            $id = $take->id;
            return $this->edit($id);
        } else {

            return $this->create();
        }
    }

    public function create()
    {
        return View::fetch('create');
    }

    public function edit($id)
    {
        $where['id'] = $id;
        $data = $this->model->where($where)->find();
        View::assign('data', $data);

        return View::fetch('edit');
    }
}

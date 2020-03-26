<?php
declare (strict_types = 1);

namespace app\admin\controller\rent;

use app\admin\controller\Backend;
use app\admin\model\RentFetch;
use think\facade\View;
use think\Request;

class Take extends Backend
{
    protected $rentModel;
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->model = new RentFetch();

        $this->rentModel = new \app\admin\model\Rent();
    }

    public function build()
    {
        $params = $this->request->param();

        $where = [];
        $where['id'] = $params['rent_id'];
        $rent = $this->rentModel->where($where)->find();
        View::assign('rent', $rent);

        $where = [];
        $where['rent_id'] = $params['rent_id'];
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

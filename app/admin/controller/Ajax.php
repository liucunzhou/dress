<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\facade\View;
use think\Request;

class Ajax extends Backend
{
    /**
     * 单个资源
     */
    public function readSource()
    {
        $params = $this->request->param();

        $contents = '';
        switch ($params['type']) {
            case 'goods':

                $contents = $this->readDress($params['keyword']);
                break;

            case 'package':

                $contents = $this->readPackage($params['keyword']);
                break;

            default :
                $contents = '';
        }

        return $contents;
    }

    /**
     * 显示指定的资源
     *
     * @param  string  $no
     * @return \think\Response
     */
    public function readDress($no)
    {
        $model = new \app\admin\model\Dress();

        $where['sku'] = $no;
        $data = $model->where($where)->find();
        View::assign('data', $data);

        return View::fetch('dress/goods');
    }

    public function readPackage($no)
    {
        $model = new \app\admin\model\Package();

        $where['package_no'] = $no;
        $data = $model->where($where)->find();
        View::assign('data', $data);

        return View::fetch('package/package');
    }
}

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
        $params = $this->request->param();

        $model = new \app\admin\model\Dress();
        $where['sku'] = $no;
        $dress = $model->where($where)->find();
        if(!empty($dress)) {
            View::assign('data', $dress);
            if(isset($params['rent_id']) && $params['rent_id'] > 0) {
                // 编辑的时候添加直接加到商品列表里
                $rentGoodsModel = new \app\admin\model\RentGoods();
                $data = [];
                $data['rent_id'] = $params['rent_id'];
                $data['goods_type'] = 'dress';
                $data['goods_id'] = $dress->id;
                $rentGoods = $rentGoodsModel->where($data)->find();
                if(!empty($rentGoods)) {
                    return '1';
                } else {
                    $rentGoodsModel->save($data);
                    return View::fetch('dress/goods');
                }
            } else {
                $rentGoodsModel = new \app\admin\model\RentGoods();
                $data = [];
                $data['rent_id'] = $params['rent_id'];
                $data['goods_type'] = 'dress';
                $data['goods_id'] = $dress->id;
                $rentGoods = $rentGoodsModel->where($data)->find();
                if(!empty($rentGoods)) {
                    return '1';
                } else {
                    $rentGoodsModel->save($data);
                    return View::fetch('dress/goods');
                }
                // 添加的时候直接添加
                return View::fetch('dress/goods');
            }
        } else {
            return '';
        }
    }

    public function readPackage($no)
    {
        $model = new \app\admin\model\Package();

        $where['package_no'] = $no;
        $data = $model->where($where)->find();
        View::assign('data', $data);

        return View::fetch('package/package');
    }

    public function upload()
    {
        $params = $this->request->param();
        $dir = !empty($params['field']) ? $params['field'] : 'default' ;
    
        $file = request()->file('file');
        // 上传到本地服务器
        $savename = \think\facade\Filesystem::disk("public")->putFile($dir, $file);
        if($savename) {
            $config = config('filesystem.disks');
            $savename = $config['public']['url'].'/'.str_ireplace('\\', '/', $savename);
            $arr = [
                'code'  => '200',
                'msg'   => '上传成功',
                'path'  => $savename
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '上传失败'
            ];
        }

        return json($arr);
    }
}

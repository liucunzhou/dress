<?php
declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\model\AuthRule;
use think\facade\View;
use think\Request;

class Backend extends Base
{
    protected $model = '';

    public function __construct(Request $request)
    {
        parent::__construct($request);

        $where = [];
        $where['status'] = 'normal';
        $where['ismenu'] = 1;
        $rules = AuthRule::where($where)->order('weigh desc')->select();
        $menu = [];
        foreach ($rules as $rule) {
            $data = $rule->getData();
            if($data['pid'] == 0) {
                $menu[$data['id']]['info'] = $data;
            } else {
                $menu[$data['pid']]['items'][] = $data;
            }
        }

        View::assign('menu', $menu);

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

        return View::fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\Response
     */
    public function create()
    {
        //
        return View::fetch();
    }

    /**
     * 执行添加l逻辑.
     *
     * @return \think\Response
     */
    public function doCreate()
    {
        $params = $this->request->param();
        $result = $this->model->save($params['row']);

        if ($result) {
            $arr = [
                'code'  => '200',
                'redirect' => $params['redirect'],
                'msg'   => '添加成功',
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '添加成功',
            ];
        }

        return json($arr);
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        //
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        $data = $row->getData();

        View::assign('data', $data);

        return View::fetch();
    }

    /**
     * 执行编辑资源逻辑.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function doEdit()
    {
        $params = $this->request->param();

        $row = $this->model->find($params['row']['id']);

        $result = $row->save($params['row']);
        if ($result) {
            $arr = [
                'code'  => '200',
                'redirect' => $params['redirect'],
                'msg'   => '添加成功',
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '添加成功',
            ];
        }

        return json($arr);
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        //
    }
}

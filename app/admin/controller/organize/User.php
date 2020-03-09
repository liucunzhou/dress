<?php
declare (strict_types = 1);

namespace app\admin\controller\organize;

use app\admin\controller\Backend;
use think\Request;
use think\facade\View;

class User extends Backend
{

    protected $departments = [];
    protected $roles = [];

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\User();

        $departmentModel = new \app\admin\model\Department();
        $this->departments = $departmentModel->order('weigh desc')->column('id,title,weigh', 'id');

        View::assign('departments', $this->departments);
        View::assign('roles', $this->roles);

        parent::__construct($request);
    }

    /**
     * 执行添加l逻辑.
     *
     * @return \think\Response
     */
    public function doCreate()
    {
        $params = $this->request->param();
        $params['row']['password'] = md5($params['row']['password']);
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
     * 执行编辑资源逻辑.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function doEdit()
    {
        $params = $this->request->param();

        $row = $this->model->find($params['row']['id']);
        if(!empty($params['row']['password'])) {
            $params['row']['password'] = md5($params['row']['password']);
        }

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

    public function info()
    {
        return View::fetch();
    }

    public function repassword()
    {
        return View::fetch();
    }

    public function doRepassword()
    {
        $params = $this->request->param();

        $where['id'] = $this->user['id'];
        $user = $this->model->where($where)->find();
        if($user->password != md5($params['oldpassword'])) {
            $arr = [
                'code'  => '400',
                'msg'   => '原始密码不正确'
            ];
            return json($arr);
        }

        if($params['newpassword'] != $params['repassword']) {
            $arr = [
                'code'  => '400',
                'msg'   => '新密码，两次输入不一致'
            ];
            return json($arr);
        }

        $data['password'] = md5($params['newpassword']);
        $result = $user->save($data);

        if($result) {
            $arr = [
                'code'  => '200',
                'msg'   => '修改密码成功',
                'redirect' => $params['redirect'],
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '修改密码失败'
            ];
        }

        return json($arr);
    }
}

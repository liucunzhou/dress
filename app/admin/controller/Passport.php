<?php
declare (strict_types = 1);

namespace app\admin\controller;

use think\facade\View;
use think\Request;
use think\facade\Session;

class Passport extends Base
{
    public function login()
    {
        return View::fetch();
    }

    public function doLogin()
    {
        $params = $this->request->param();
        $params['password'] =  md5($params['password']);
        $adminModel = new \app\admin\model\User();

        $user = $adminModel->where($params)->find();
        if(!empty($user)) {
            // 记录登陆地址
            // Session::set('user', $user->getData());
            session('user', $user->getData());
            Session::save();
            $arr = [
                'code'      => '200',
                'redirect'  => '/admin.php?s=User/info',
                'msg'       => '登陆成功'
            ];
        } else {
            $arr = [
                'code'      => '500',
                'msg'       => '登陆失败'
            ];
        }

        return json($arr);
    }

    public function logout()
    {
        Session::clear();
        return redirect($this->loginUrl);
    }
}

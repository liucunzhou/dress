<?php
/**
 * Created by PhpStorm.
 * User: PC
 * Date: 2020/4/20
 * Time: 21:37
 */

namespace app\admin\controller\organize;


use app\admin\controller\Backend;
use think\facade\View;

class Auth extends Backend
{
    /**
     * 角色
     */
    public function role()
    {
        return View::fetch();
    }
}
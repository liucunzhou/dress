<?php
declare (strict_types = 1);

namespace app\middleware;

use think\facade\Session;

class Auth
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
    
        $user = Session::get('user');
        if(!empty($user)) {
            return $next($request);
        } else {
            return \redirect('/admin/passport/login');
        }
    }
}

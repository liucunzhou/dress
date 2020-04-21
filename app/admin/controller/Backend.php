<?php
declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\model\AuthRule;
use app\middleware\Auth;
use think\facade\View;
use think\Request;
use think\facade\Session;
use think\exception\ValidateException;

class Backend extends Base
{
    protected $user = [];
    protected $validate = '';
    protected $model = '';
    protected $middleware = [Auth::class];

    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->user = Session::get('user');
        View::assign('user', $this->user);

        ### 构建左侧导航
        $this->buildLeftSide();

        ### 构建面包屑
        $this->buildBreadcrumb();
    }

    public function index()
    {
        $where['status'] = 'normal';
        $rows = $this->model->where($where)->order('weigh desc')->select();
        View::assign('rows', $rows);

        return View::fetch();
    }

    public function create()
    {
        return View::fetch();
    }

    public function doCreate()
    {
        $params = $this->request->param();
        $failMsg = '添加失败';
        if (!empty($this->validate)) {
   
            try {
                // $this->validate->check($params['row']);
            } catch (ValidateException $e) {
                // 验证失败 输出错误信息
                // dump($e->getError());
            }
        }

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
                'msg'   => $failMsg,
            ];
        }

        return json($arr);
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
        View::assign('data', $row);

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
                'msg'   => '保存成功',
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '保存失败',
            ];
        }

        return json($arr);
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        $row = $this->model->find($id);
        $result = $row->delete();
        if ($result) {
            $arr = [
                'code'  => '200',
                'msg'   => '删除成功',
            ];
        } else {
            $arr = [
                'code'  => '500',
                'msg'   => '删除失败',
            ];
        }

        return json($arr);
    }

    /**
     * 生成source
     */
    public function source($id)
    {
        $result = $this->model->column($id);

        $filename = $this->model->getName();
        $filename = strtolower($filename);
        $content = "var {$filename} =".json_encode($result).";";
        file_put_contents("./assets/source/{$filename}.js", $content);
    }

    private function buildLeftSide()
    {
        $module = $this->request->rootUrl();
        $controller = $this->request->controller();
        $action = $this->request->action();
        $cpath = strtolower($module.'/'.$controller . '/' . $action);

        ### 获取当前事件的目录
        $authItem = AuthRule::where('name', '=', $cpath)->find();
        $depth = explode('-', $authItem->path);
        $dirId = $depth[1];

        $where = [];
        $where['status'] = 'normal';
        $where['ismenu'] = 1;
        $rules = AuthRule::where($where)->order('weigh desc')->select();
        $menu = [];

        ### 初始化菜单
        foreach ($rules as $rule) {
            $data = $rule->getData();
            if($data['pid'] == 0) {
                $menu[$data['id']]['info'] = $data;
                $menu[$data['id']]['active'] = $data['id'] == $dirId ? '1' : 0;
            } else {
                $menu[$data['pid']]['items'][] = $data;
            }
        }

        View::assign('menu', $menu);
    }

    private function buildBreadcrumb()
    {
        $module = $this->request->rootUrl();
        $controller = $this->request->controller();
        $action = $this->request->action();
        $cpath = strtolower($module.'/'.$controller . '/' . $action);

        ### 获取当前事件的目录
        $authItem = AuthRule::where('name', '=', $cpath)->find();
        $depth = explode('-', $authItem->path);

        $breadcrumb = [];
        foreach ($depth as $value) {
            if($value <=0 ) continue;

            $authItem = AuthRule::where('id', '=', $value)->find();
            $breadcrumb[] = [
                'title' => $authItem->title,
                'url'   => url($authItem->name)->build()
            ];
        }

        View::assign('breadcrumb', $breadcrumb);
    }
}

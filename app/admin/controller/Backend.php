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
    protected $breadcrumbIndex = [];
    protected $breadcrumbCreate = [];
    protected $breadcrumbEdit = [];

    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->user = Session::get('user');
        View::assign('user', $this->user);

        $rule = $this->request->rule();
        $cpath = $rule->getRule();
        if(empty($cpath)) {
            $controller = $this->request->controller();
            $action = $this->request->action();
            $cpath = strtolower($controller . '/' . $action);
        } else {
            $cpath = strtolower($cpath);
        }

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

        
        foreach($menu as $key=>&$row) {
            if(!isset($row['info'])) {
                unset($menu[$key]);
                continue;
            }

            $path = strtolower($row['info']['name']);
            if($cpath == $path) {
                $row['info']['active'] = 1;
            } else {
                $row['info']['active'] = 0;
            }
            
            if(isset($row['items'])) {
                foreach($row['items'] as &$line) {
                    $path = strtolower($line['name']);
                    if($cpath == $path) {
                        $line['active'] = 1;
                        $row['info']['active'] = 1;
                    } else {
                        $line['active'] = 0;
                    }
                }
            }
        }

        View::assign('menu', $menu);

    }

    public function index()
    {
        View::assign('breadcrumb', $this->breadcrumbIndex);

        $where['status'] = 'normal';
        $rows = $this->model->where($where)->order('weigh desc')->select();
        View::assign('rows', $rows);

        return View::fetch();
    }

    public function create()
    {
        View::assign('breadcrumb', $this->breadcrumbCreate);
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


        View::assign('breadcrumb', $this->breadcrumbEdit);

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
                'msg'   => '删除是啊比',
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
}

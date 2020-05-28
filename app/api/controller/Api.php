<?php
declare (strict_types = 1);

namespace app\api\controller;

use think\Request;
use think\exception\ValidateException;

class Api
{
    protected $request = null;
    protected $user = [];
    protected $validate = '';
    protected $model = '';
    protected $onlines = [];

    public function __construct(Request $request)
    {
        $this->request = $request;
        $this->onlines = [
            'normal'   => [
                'title' => '在线'
            ],
            'hidden'   => [
                'title' => '下线'
            ],
        ];
    }

    public function index()
    {
        $where = [];
        $model  = $this->model;
        $rows   = $model->where($where)->order('id desc')->paginate(10);
        $fieldSet = [
            [
                'id'        => 'id',
                'field'     => 'id',
                'label'     => '编号',
                'width'     => '50',
                'source'    => 'value',
            ],
            [
                'id'        => 'title',
                'field'     => 'title',
                'label'     => '名称',
                'width'     => '',
                'source'    => 'value',
            ],
            [
                'id'        => 'status',
                'field'     => 'status',
                'label'     => '状态',
                'width'     => '80',
                'source'    => 'value',
            ],
            [
                'id'        => 'weigh',
                'field'     => 'weigh',
                'label'     => '排序',
                'width'     => '80',
                'source'    => 'value',
            ],
        ];
        $list = [];
        foreach ($rows as $key=>$row) {
            foreach ($fieldSet as $value) {
                $id = $value['id'];
                $field = $value['field'];
                if($value['source'] == 'value') {
                    $list[$key][$field] = $row->$field;
                } else {
                    $index = $row->$field;
                    $sourceName = $value['source'];
                    $sources = $this->$sourceName;
                    $list[$key][$id] = $sources[$index]['title'];
                }
            }
        }

        $fieldSet[] = [
            'id'        => 'operation',
            'field'     => 'operation',
            'label'     => '操作',
            'width'     => '',
            'buttons'   => [
                [
                    'label'     => '查看',
                    'type'      => 'text',
                    'size'      => 'small',
                    'action'    => 'show'
                ]
            ],
        ];

        $result = [
            'code'  => '200',
            'msg'   => '获取数据成功',
            'data'  => [
                'list'      => $list,
                'fields'    => $fieldSet,
            ]
        ];
        return json($result);
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
        $result = [
            'code'  => '200',
            'msg'   => '获取数据成功',
            'data'  => [
                'row' => $row
            ]
        ];

        return json($result);
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
}

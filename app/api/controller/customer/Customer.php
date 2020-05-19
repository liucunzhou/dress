<?php
declare (strict_types = 1);

namespace app\api\controller\customer;

use app\api\controller\Api;
use think\Request;

class Customer extends Api
{
    protected $stores = [];
    protected $sources = [];

    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->validate = new \app\admin\validate\Customer();
        $this->model = new \app\admin\model\Customer();

        $storeModel = new \app\admin\model\Store();
        $this->stores = $storeModel->order('weigh desc')->column('id,title,weigh', 'id');

        $sourceModel = new \app\admin\model\Source();
        $this->sources =$sourceModel->order('weigh desc')->column('id,title,weigh', 'id');
    }

    public function index()
    {
        // $where['status'] = 'normal';
        $where = [];
        $model  = $this->model;
        $rows   = $model->where($where)->order('weigh desc')->paginate(10);
        $fieldSet = [
            [
                'id'        => 'id',
                'field'     => 'id',
                'label'     => '编号',
                'width'     => '50',
                'source'    => 'value',
            ],
            [
                'id'        => 'visit_times',
                'field'     => 'visit_times',
                'label'     => '回访数',
                'width'     => '100',
                'source'    => 'value',
            ],
            [
                'id'        => 'source',
                'field'     => 'source_id',
                'label'     => '客资来源',
                'width'     => '120',
                'source'    => 'sources',
            ],
            [
                'id'        => 'realname',
                'field'     => 'realname',
                'label'     => '客户姓名',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'mobile',
                'field'     => 'mobile',
                'label'     => '联系电话',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'mobile1',
                'field'     => 'mobile1',
                'label'     => '微信号',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'sex',
                'field'     => 'sex',
                'label'     => '性别',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'createtime',
                'field'     => 'createtime',
                'label'     => '创建时间',
                'width'     => '180',
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
                    'label'     => '编辑',
                    'type'      => 'text',
                    'size'      => 'small',
                    'action'    => 'edit'
                ],
                [
                    'label'     => '回访',
                    'type'      => 'text',
                    'size'      => 'small',
                    'action'    => 'visit'
                ],
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

    public function sea()
    {
        $where = [];
        // $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function promoter()
    {
        $where = [];
        // $where['status'] = 'normal';
        $rows = $this->model->where($where)->select();
        View::assign('rows', $rows);
        //
        return View::fetch();
    }

    public function allocate($id)
    {
        $userModel = new \app\admin\model\User();
        $dressers = $userModel->select();
        View::assign('dressers', $dressers);

        $row = $this->model->find($id);
        View::assign('data', $row);
        return View::fetch();
    }
}

<?php
declare (strict_types = 1);

namespace app\api\controller\rent;

use app\api\controller\Api;
use think\Request;

class Rent extends Api
{
    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->model = new \app\admin\model\Rent();
    }


    public function index()
    {
        $where = [];
        $model  = $this->model;
        $rows   = $model->where($where)->order('id desc')->paginate(10);
        $fieldSet = [
            [
                'id'        => 'order_no',
                'field'     => 'order_no',
                'label'     => '订单号',
                'width'     => '180',
                'source'    => 'value',
            ],
            [
                'id'        => 'status',
                'field'     => 'status',
                'label'     => '订单状态',
                'width'     => '100',
                'source'    => 'value',
            ],
            [
                'id'        => 'store',
                'field'     => 'store_id',
                'label'     => '门店',
                'width'     => '100',
                'source'    => 'value',
            ],
            [
                'id'        => 'totals',
                'field'     => 'totals',
                'label'     => '订单金额',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'groom',
                'field'     => 'groom',
                'label'     => '男宾姓名',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'groom_mobile',
                'field'     => 'groom_mobile',
                'label'     => '男宾电话',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'bride',
                'field'     => 'bride',
                'label'     => '女宾姓名',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'bride_mobile',
                'field'     => 'bride_mobile',
                'label'     => '女宾电话',
                'width'     => '120',
                'source'    => 'value',
            ],
            [
                'id'        => 'fetch_date',
                'field'     => 'fetch_date',
                'label'     => '取件日期',
                'width'     => '180',
                'source'    => 'value',
            ],
            [
                'id'        => 'return_date',
                'field'     => 'return_date',
                'label'     => '还件日期',
                'width'     => '180',
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
}

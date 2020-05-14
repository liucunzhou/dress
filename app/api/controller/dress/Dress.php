<?php
declare (strict_types = 1);

namespace app\api\controller\dress;

use app\api\controller\Api;
use think\Request;

class Dress extends Api
{
    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->model = new \app\admin\model\Dress();
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
                'id'        => 'sku',
                'field'     => 'sku',
                'label'     => '商品编码',
                'width'     => '',
                'source'    => 'value',
            ],
            [
                'id'        => 'category',
                'field'     => 'category_id',
                'label'     => '商品分类',
                'width'     => '100',
                'source'    => 'value',
            ],
            [
                'id'        => 'title',
                'field'     => 'title',
                'label'     => '商品名称',
                'width'     => '',
                'source'    => 'value',
            ],
            [
                'id'        => 'rent_price',
                'field'     => 'rent_price',
                'label'     => '租赁价格',
                'width'     => '',
                'source'    => 'value',
            ],
            [
                'id'        => 'sale_price',
                'field'     => 'sale_price',
                'label'     => '出售价格',
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
}

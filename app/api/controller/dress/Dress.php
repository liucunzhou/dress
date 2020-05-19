<?php
declare (strict_types = 1);

namespace app\api\controller\dress;

use app\admin\model\DressCategory;
use app\api\controller\Api;
use think\Request;

class Dress extends Api
{
    protected  $categories = [];
    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->model = new \app\admin\model\Dress();

        $category = new DressCategory();
        $this->categories = $category->column('id,title,weigh', 'id');
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
                'align'     => 'center'
            ],
            [
                'id'        => 'sku',
                'field'     => 'sku',
                'label'     => '商品编码',
                'width'     => '',
                'source'    => 'value',
                'align'     => 'center'
            ],
            [
                'id'        => 'category',
                'field'     => 'category_id',
                'label'     => '商品分类',
                'width'     => '100',
                'source'    => 'categories',
                'align'     => 'center'
            ],
            [
                'id'        => 'title',
                'field'     => 'title',
                'label'     => '商品名称',
                'width'     => '',
                'source'    => 'value',
                'align'     => 'center'
            ],
            [
                'id'        => 'images',
                'field'     => 'images',
                'label'     => '商品图片',
                'width'     => '',
                'source'    => 'value',
                'align'     => 'center'
            ],
            [
                'id'        => 'rent_price',
                'field'     => 'rent_price',
                'label'     => '租赁价格',
                'width'     => '',
                'source'    => 'value',
                'align'     => 'center'
            ],
            [
                'id'        => 'sale_price',
                'field'     => 'sale_price',
                'label'     => '出售价格',
                'width'     => '',
                'source'    => 'value',
                'align'     => 'center'
            ],
            [
                'id'        => 'status',
                'field'     => 'status',
                'label'     => '状态',
                'width'     => '80',
                'source'    => 'onlines',
                'align'     => 'center'
            ],
            [
                'id'        => 'weigh',
                'field'     => 'weigh',
                'label'     => '排序',
                'width'     => '80',
                'source'    => 'value',
                'align'     => 'center'
            ],
        ];
        $list = [];
        $domain = $this->request->domain();
        foreach ($rows as $key=>$row) {
            foreach ($fieldSet as $value) {
                $id = $value['id'];
                $field = $value['field'];

                if (stripos($id, 'image') !== false) {
                    $list[$key][$field] = $domain.$row->$field;
                } else if ($value['source'] != 'value') {
                    $index = $row->$field;
                    $sourceName = $value['source'];
                    $sources = $this->$sourceName;
                    $list[$key][$id] = $sources[$index]['title'];
                } else {
                    $list[$key][$id] = $row->$field;
                }
            }
        }

        $opertaion = [
            [
                'id'        => 'operation',
                'field'     => 'operation',
                'label'     => '操作',
                'align'     => '',
                'width'     => '',
                'buttons'   => [
                    [
                        'label'     => '查看',
                        'type'      => 'text',
                        'size'      => 'small',
                        'action'    => 'show'
                    ]
                ],
            ]
        ];

        $fieldSet = array_merge($fieldSet, $opertaion);

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

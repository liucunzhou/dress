<?php
declare (strict_types = 1);

namespace app\admin\controller\organize;

use app\admin\controller\Backend;
use think\Request;

class Department extends Backend
{

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Department();
        parent::__construct($request);

        $this->breadcrumbIndex = [
            [
                'title' =>  '组织架构',
                'url'   =>  ''
            ],
            [
                'title' =>  '部门管理',
                'url'   =>  ''
            ]
        ];

        $this->breadcrumbCreate = [
            [
                'title' =>  '组织架构',
                'url'   =>  ''
            ],
            [
                'title' =>  '部门管理',
                'url'   =>  url('/admin/organize.department/index')
            ],
            [
                'title' =>  '添加部门',
                'url'   =>  ''
            ],
        ];


        $this->breadcrumbEdit = [
            [
                'title' =>  '组织架构',
                'url'   =>  ''
            ],
            [
                'title' =>  '部门管理',
                'url'   =>  url('/admin/organize.department/index')
            ],
            [
                'title' =>  '编辑部门',
                'url'   =>  ''
            ],
        ];
    }
}

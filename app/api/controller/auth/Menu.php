<?php
declare (strict_types = 1);

namespace app\api\controller\auth;

use app\Api\controller\Api;
use think\Request;

class Menu extends Api
{

    public function index()
    {
        /**
        {
            icon: "el-icon-message",
            title: "客资管理",
            items: [
              {
                  title: "客资列表",
                icon: "el-icon-message",
                path: "/customer/index"
              },
              {
                  title: "回访列表",
                icon: "el-icon-message",
                path: "/visit/index"
              },
              {
                  title: "进店列表",
                icon: "el-icon-message",
                path: "/into/index"
              }
            ]
          },
            {
                icon: "el-icon-message",
            title: "组织架构",
            items: [
              {
                  title: "部门管理",
                icon: "el-icon-message",
                path: "/department/index"
              },
              {
                  title: "用户管理",
                icon: "el-icon-message",
                path: "/user/index"
              }
            ]
          }
        **/

        $menus = [
            [
                'id'    => 1,
                'icon'  => 'el-icon-s-custom',
                'title'  => '客资管理',
                'items'  => [
                    [
                        'id'    => '1.1',
                        'icon'  => '',
                        'title' => '邀约客资',
                        'path'  => '/customer/promoter',
                    ],
                    [
                        'id'    => '1.2',
                        'icon'  => '',
                        'title' => '我的客资',
                        'path'  => '/customer/index',
                    ],
                    [
                        'id'    => '1.3',
                        'icon'  => '',
                        'title' => '客资公海',
                        'path'  => '/customer/sea',
                    ],
                ]
            ],
            [
                'id'    => 2,
                'icon'  => 'el-icon-shopping-cart-1',
                'title'  => '订单管理',
                'items'  => [
                    [
                        'id'    => '2.1',
                        'icon'  => '',
                        'title' => '租赁订单',
                        'path'  => '/rent/index',
                    ],
                    [
                        'id'    => '2.2',
                        'icon'  => '',
                        'title' => '销售订单',
                        'path'  => '/sale/index',
                    ]
                ]
            ],
            [
                'id'    => 3,
                'icon'  => 'el-icon-goods',
                'title'  => '礼服管理',
                'items'  => [
                    [
                        'id'    => '3.1',
                        'icon'  => '',
                        'title' => '礼服列表',
                        'path'  => '/dress/index',
                    ],
                    [
                        'id'    => '3.2',
                        'icon'  => '',
                        'title' => '礼服分类',
                        'path'  => '/dress/category',
                    ],
                    [
                        'id'    => '3.3',
                        'icon'  => '',
                        'title' => '礼服套餐',
                        'path'  => '/dress/package',
                    ],
                    [
                        'id'    => '3.4',
                        'icon'  => '',
                        'title' => '供应商',
                        'path'  => '/dress/supplier',
                    ],
                ]
            ],
            [
                'id'    => 4,
                'icon'  => 'el-icon-data-analysis',
                'title'  => '组织架构',
                'items'  => [
                    [
                        'id'    => '4.1',
                        'icon'  => '',
                        'title' => '部门管理',
                        'path'  => '/department/index',
                    ],
                    [
                        'id'    => '4.2',
                        'icon'  => '',
                        'title' => '员工管理',
                        'path'  => '/user/index',
                    ]
                ]
            ],

        ];

        $result = [
            'code'  => '200',
            'msg'   => '获取菜单成功',
            'data'  => [
                'menus'  => $menus
            ]
        ];

        return json($result);
    }
}

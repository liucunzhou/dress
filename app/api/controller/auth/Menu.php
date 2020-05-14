<?php
declare (strict_types = 1);

namespace app\api\controller\auth;

use app\api\controller\Api;
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
                index: "/customer/index"
              },
              {
                  title: "回访列表",
                icon: "el-icon-message",
                index: "/visit/index"
              },
              {
                  title: "进店列表",
                icon: "el-icon-message",
                index: "/into/index"
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
                index: "/department/index"
              },
              {
                  title: "用户管理",
                icon: "el-icon-message",
                index: "/user/index"
              }
            ]
          }
        **/

        $menus = [
            [
                'id'    => 0,
                'icon'  => 'el-icon-lx-home',
                'index' => 'dashboard',
                'title' => '系统首页'
            ],
            [
                'id'    => 1,
                'icon'  => 'el-icon-s-custom',
                'index' => 'customer',
                'title'  => '客资管理',
                'items'  => [
                    [
                        'id'    => '1.1',
                        'icon'  => '',
                        'title' => '邀约客资',
                        'index'  => '/customer/promoter',
                    ],
                    [
                        'id'    => '1.2',
                        'icon'  => '',
                        'title' => '我的客资',
                        'index'  => '/customer/index',
                    ],
                    [
                        'id'    => '1.3',
                        'icon'  => '',
                        'title' => '客资公海',
                        'index'  => '/customer/sea',
                    ],
                ]
            ],
            [
                'id'    => 2,
                'icon'  => 'el-icon-shopping-cart-1',
                'title'  => '订单管理',
                'index' => 'order',
                'items'  => [
                    [
                        'id'    => '2.1',
                        'icon'  => '',
                        'title' => '租赁订单',
                        'index'  => '/rent/index',
                    ],
                    [
                        'id'    => '2.2',
                        'icon'  => '',
                        'title' => '销售订单',
                        'index'  => '/sale/index',
                    ]
                ]
            ],
            [
                'id'    => 3,
                'icon'  => 'el-icon-goods',
                'title'  => '礼服管理',
                'index' => 'dress',
                'items'  => [
                    [
                        'id'    => '3.1',
                        'icon'  => '',
                        'title' => '礼服列表',
                        'index'  => '/dress/dress/index',
                    ],
                    [
                        'id'    => '3.2',
                        'icon'  => '',
                        'title' => '礼服分类',
                        'index'  => '/dress/category/index',
                    ],
                    [
                        'id'    => '3.3',
                        'icon'  => '',
                        'title' => '礼服套餐',
                        'index'  => '/dress/package/index',
                    ],
                    [
                        'id'    => '3.4',
                        'icon'  => '',
                        'title' => '供应商',
                        'index'  => '/dress/supplier/index',
                    ],
                ]
            ],
            [
                'id'    => 4,
                'icon'  => 'el-icon-data-analysis',
                'title'  => '组织架构',
                'index' => 'organize',
                'items'  => [
                    [
                        'id'    => '4.1',
                        'icon'  => '',
                        'title' => '部门管理',
                        'index'  => '/department/index',
                    ],
                    [
                        'id'    => '4.2',
                        'icon'  => '',
                        'title' => '员工管理',
                        'index'  => '/user/index',
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

<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

// rent
Route::get('rent/index', 'rent.rent/index');
Route::get('rent/create', 'rent.rent/create');
Route::post('rent/doCreate', 'rent.rent/doCreate');
Route::get('rent/edit', 'rent.rent/edit');
Route::post('rent/doEdit', 'rent.rent/doEdit');
Route::get('rent/read', 'rent.rent/read');
Route::post('rent/delete', 'rent.rent/delete');
Route::post('rent/removeGoods', 'rent.rent/removeGoods');
Route::get('rent/schedule', 'rent.rent/schedule');

Route::get('take/index', 'rent.take/index');
Route::get('take/create', 'rent.take/create');
Route::get('take/index', 'rent.take/edit');
Route::post('take/doCreate', 'rent.take/doCreate');
Route::post('take/doEdit', 'rent.take/doEdit');
Route::get('take/delete', 'rent.take/delete');

Route::get('back/index', 'rent.back/index');
Route::get('back/create', 'rent.back/create');
Route::get('back/index', 'rent.back/edit');
Route::post('back/doCreate', 'rent.back/doCreate');
Route::post('back/doEdit', 'rent.back/doEdit');
Route::get('back/delete', 'rent.back/delete');

Route::get('wash/index', 'rent.wash/index');
Route::get('wash/create', 'rent.wash/create');
Route::get('wash/index', 'rent.wash/edit');
Route::post('wash/doCreate', 'rent.wash/doCreate');
Route::post('wash/doEdit', 'rent.wash/doEdit');
Route::get('wash/delete', 'rent.wash/delete');

// dictionary
Route::get('general/config', 'dictionary.general/config');
Route::post('general/config', 'dictionary.general/doConfig');
Route::get('general/system', 'dictionary.general/system');

Route::get('source/index', 'dictionary.source/index');
Route::get('source/create', 'dictionary.source/create');
Route::get('source/index', 'dictionary.source/edit');
Route::post('source/doCreate', 'dictionary.source/doCreate');
Route::post('source/doEdit', 'dictionary.source/doEdit');
Route::get('source/delete', 'dictionary.source/delete');

Route::get('size/index', 'dictionary.size/index');
Route::get('size/create', 'dictionary.size/create');
Route::get('size/edit', 'dictionary.size/edit');
Route::post('size/doCreate', 'dictionary.size/doCreate');
Route::post('size/doEdit', 'dictionary.size/doEdit');
Route::get('size/delete', 'dictionary.size/delete');

Route::get('color/index', 'dictionary.color/index');
Route::get('color/create', 'dictionary.color/create');
Route::get('color/edit', 'dictionary.color/edit');
Route::post('color/doCreate', 'dictionary.color/doCreate');
Route::post('color/doEdit', 'dictionary.color/doEdit');
Route::get('color/delete', 'dictionary.color/delete');

Route::get('store/index', 'dictionary.store/index');
Route::get('store/create', 'dictionary.store/create');
Route::get('store/edit', 'dictionary.store/edit');
Route::post('store/doCreate', 'dictionary.store/doCreate');
Route::post('store/doEdit', 'dictionary.store/doEdit');
Route::get('store/delete', 'dictionary.store/delete');

Route::get('payment/index', 'dictionary.payment/index');
Route::get('payment/create', 'dictionary.payment/create');
Route::get('payment/edit', 'dictionary.payment/edit');
Route::post('payment/doCreate', 'dictionary.payment/doCreate');
Route::post('payment/doEdit', 'dictionary.payment/doEdit');
Route::get('payment/delete', 'dictionary.payment/delete');

// organize
Route::get('department/index', 'organize.department/index');
Route::get('department/create', 'organize.department/create');
Route::get('department/edit', 'organize.department/edit');
Route::post('department/doCreate', 'organize.department/doCreate');
Route::post('department/doEdit', 'organize.department/doEdit');
Route::get('department/delete', 'organize.department/delete');

Route::get('user/index', 'organize.user/index');
Route::get('user/create', 'organize.user/create');
Route::get('user/edit', 'organize.user/edit');
Route::get('user/info', 'organize.user/info');
Route::get('user/repassword', 'organize.user/repassword');
Route::post('user/doRepassword', 'organize.user/doRepassword');
Route::post('user/doCreate', 'organize.user/doCreate');
Route::post('user/doEdit', 'organize.user/doEdit');
Route::get('user/delete', 'organize.user/delete');

// auth
Route::get('AuthRule/index', 'auth.AuthRule/index');
Route::get('AuthRule/delete', 'auth.AuthRule/delete');
Route::get('AuthRule/create', 'auth.AuthRule/create');
Route::get('AuthRule/edit', 'auth.AuthRule/edit');
Route::post('AuthRule/doCreate', 'auth.AuthRule/doCreate');
Route::post('AuthRule/doEdit', 'auth.AuthRule/doEdit');

// dress
Route::get('dress/index', 'dress.dress/index');
Route::get('dress/create', 'dress.dress/create');
Route::get('dress/edit', 'dress.dress/edit');
Route::post('dress/doCreate', 'dress.dress/doCreate');
Route::post('dress/doEdit', 'dress.dress/doEdit');
Route::get('dress/delete', 'dress.dress/delete');

Route::get('DressCategory/index', 'dress.DressCategory/index');
Route::get('DressCategory/create', 'dress.DressCategory/create');
Route::get('DressCategory/edit', 'dress.DressCategory/edit');
Route::post('DressCategory/doCreate', 'dress.DressCategory/doCreate');
Route::post('DressCategory/doEdit', 'dress.DressCategory/doEdit');
Route::get('DressCategory/delete', 'dress.DressCategory/delete');

Route::get('package/index', 'dress.package/index');
Route::get('package/create', 'dress.package/create');
Route::get('package/edit', 'dress.package/edit');
Route::post('package/doCreate', 'dress.package/doCreate');
Route::post('package/doEdit', 'dress.package/doEdit');
Route::get('package/delete', 'dress.package/delete');

Route::get('scrap/index', 'dress.scrap/index');
Route::get('scrap/create', 'dress.scrap/create');
Route::get('scrap/edit', 'dress.scrap/edit');
Route::post('scrap/doCreate', 'dress.scrap/doCreate');
Route::post('scrap/doEdit', 'dress.scrap/doEdit');
Route::get('scrap/delete', 'dress.scrap/delete');

Route::get('supplier/index', 'dress.supplier/index');
Route::get('supplier/delete', 'dress.supplier/delete');
Route::get('supplier/create', 'dress.supplier/create');
Route::get('supplier/edit', 'dress.supplier/edit');
Route::post('supplier/doCreate', 'dress.supplier/doCreate');
Route::post('supplier/doEdit', 'dress.supplier/doEdit');

// customer
Route::get('customer/promoter', 'customer.customer/promoter');
Route::get('customer/index', 'customer.customer/index');
Route::get('customer/sea', 'customer.customer/sea');
Route::get('customer/allocate', 'customer.customer/allocate');
Route::get('customer/create', 'customer.customer/create');
Route::get('customer/edit', 'customer.customer/edit');
Route::post('customer/doCreate', 'customer.customer/doCreate');
Route::post('customer/doEdit', 'customer.customer/doEdit');
Route::get('customer/delete', 'customer.customer/delete');

Route::get('visit/index', 'customer.visit/index');
Route::get('visit/create', 'customer.visit/create');
Route::get('visit/delete', 'customer.visit/delete');
Route::post('visit/doCreate', 'customer.visit/doCreate');
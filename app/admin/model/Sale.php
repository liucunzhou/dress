<?php
declare (strict_types = 1);

namespace app\admin\model;

use think\Model;

/**
 * @mixin think\Model
 */
class Sale extends Model
{
    //
    protected $autoWriteTimestamp = true;
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    protected $type = [
        'marry_date' => 'timestamp',
        'fetch_date' => 'timestamp',
        'return_date' => 'timestamp',
    ];
}

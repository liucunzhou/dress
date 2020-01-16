<?php
declare (strict_types = 1);

namespace app\admin\model;

use think\Model;

/**
 * @mixin think\Model
 */
class Rent extends Model
{
    protected $autoWriteTimestamp = true;
    protected $createTime = 'createtime';
    protected $updateTime = 'updatetime';

    protected $type = [
        'fetch_date' => 'timestamp',
        'rent_date' => 'timestamp',
        'back_date' => 'timestamp',
    ];
}

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
        'marry_date' => 'timestamp',
        'fetch_date' => 'timestamp',
        'return_date' => 'timestamp',
    ];

    public function getOrderByDressId($dressId)
    {
        $rentGoods = new RentGoods;
        $where = [];
        $where['goods_type'] = 'dress';
        $where['goods_id'] = $dressId;
        $rentGoods = $rentGoods->where($where)->find();
        if(empty($rentGoods)) return false;

        $where = [];
        $where['id'] = $rentGoods->rent_id;
        return $this->where($where)->find();
    }
}

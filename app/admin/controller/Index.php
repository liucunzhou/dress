<?php
declare (strict_types = 1);

namespace app\admin\controller;

use app\admin\model\AuthRule;
use think\facade\View;

class Index extends Backend
{
    public function index()
    {
        return View::fetch();
    }

    public function initRule()
    {
        $authRule = new AuthRule();
        $where = [];
        $where[] = ['pid', '=', 0];
        $list = $authRule->where($where)->order('weigh desc')->select();
        foreach ($list as $key=>$row) {
            $data = [];
            $data['path'] = '0-'.$row->id.'-';
            $data['level'] = 1;
            $row->save($data);
        }
    }

    public function initRule1()
    {
        $authRule = new AuthRule();
        $where = [];
        $where[] = ['pid', '=', 0];
        $pids = $authRule->where($where)->column('id');

        $where = [];
        $where[] = ['pid', 'in', $pids];
        $list = $authRule->where($where)->order('weigh desc')->select();
        foreach ($list as $key=>$row) {
            $data = [];
            $data['path'] = '0-'.$row->pid.'-'.$row->id.'-';
            $data['level'] = 2;
            $row->save($data);
        }
    }

    public function initRule2()
    {
        $authRule = new AuthRule();
        $where = [];
        $where[] = ['level', '=', 2];
        $rules = $authRule->where($where)->column('id,path', 'id');
        $pids = array_keys($rules);

        $where = [];
        $where[] = ['pid', 'in', $pids];
        $list = $authRule->where($where)->order('weigh desc')->select();
        foreach ($list as $key=>$row) {
            $ppath = $rules[$row->pid]['path'];
            $data = [];
            $data['path'] = $ppath.$row->id.'-';
            $data['level'] = 3;
            $row->save($data);
        }
    }
}

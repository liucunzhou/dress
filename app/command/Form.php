<?php
declare (strict_types = 1);

namespace app\command;

use app\admin\model\Category;
use think\console\Command;
use think\console\Input;
use think\console\input\Argument;
use think\console\input\Option;
use think\console\Output;
use think\facade\App;
use think\facade\Db;
use think\facade\View;

class Form extends Command
{
    protected function configure()
    {
        // 指令配置
        $this->setName('form')
            ->addOption('model', null,Option::VALUE_REQUIRED, 'model\'s name')
            ->setDescription('the form command');        
    }

    protected function execute(Input $input, Output $output)
    {
        if ($input->hasOption('model')) {
            $model = PHP_EOL . 'model ' . $input->getOption('model');
        } else {
            $model = '';
        }

        $fields = Db::name('auth_rule')->getFields();

        $viewPath =  App::getInstance()->getBasePath().'admin/view/';
        echo $viewPath;
    }

    protected function fields($table)
    {

    }

    protected function createForm()
    {

    }
}

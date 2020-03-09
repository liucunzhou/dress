<?php
declare (strict_types = 1);

namespace app\admin\controller\dress;

use app\admin\controller\Backend;
use app\admin\model\Color;
use app\admin\model\DressCategory;
use app\admin\model\Size;
use think\facade\View;
use think\Request;

class Dress extends Backend
{

    protected $DressCategory = null;
    protected $dressCategories = [];
    protected $sizes = [];
    protected $colors = [];
    protected $suppliers = [];

    public function __construct(Request $request)
    {
        $this->model = new \app\admin\model\Dress();

        // get DressCategory list
        $this->DressCategory = new DressCategory();
        $this->dressCategories = $this->DressCategory->column('id,title,weigh');
        View::assign('dressCategories', $this->dressCategories);

        $SizeModel = new Size();
        $this->sizes = $SizeModel->column('id,title,weigh');
        View::assign('sizes', $this->sizes);

        $ColorModel = new Color();
        $this->colors = $ColorModel->column('id,title,weigh');
        View::assign('colors', $this->colors);

        $this->suppliers = [];
        View::assign('suppliers', $this->suppliers);

        parent::__construct($request);
    }
}

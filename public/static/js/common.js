$(function(){
    $(".sidebar-menu li").bind({
        click : function() {
            if($(this).hasClass("active")) {
                $(".sidebar-menu li").removeClass("active");            
            } else {
                $(".sidebar-menu li").removeClass("active");            
                $(this).addClass("active");
            }
        }
    });

    $(".layui-right-side").click(function () {
        var layer = layui.layer;
        var url = $(this).attr('data-action');
        var title = $(this).attr('title');
        var height = window.innerHeight;
        var percent = $(this).attr("data-width");
        if(percent != undefined) {
            percent = parseInt(percent)/100;
        } else {
            percent = 0.6;
        }
        var width = window.innerWidth * percent;

        layer.open({
            type: 2,
            title: title,
            content: url,
            area: [width + 'px', height + 'px'],
            offset: 'rb'
        });
    });

    $(".layui-center").click(function () {
        var layer = layui.layer;
        var url = $(this).attr('data-action');
        var title = $(this).attr('title');
        var height = window.innerHeight;
        var percent = $(this).attr("data-width");
        if(percent != undefined) {
            percent = parseInt(percent)/100;
        } else {
            percent = 0.6;
        }
        var width = window.innerWidth * percent;

        layer.open({
            type: 2,
            title: title,
            content: url,
            area: [width + 'px', height + 'px'],
        });
    });


    $('.date').datetimepicker({
        format: 'yyyy-mm-dd hh:ii',
        language: 'zh-CN',
        minView: 1
    });
   
    $(".form-ajax").submit(function () {
        var url = $(this).attr('action');
        var data = $(this).serialize();
        $.post(url, data, function (res) {
            if(res.code == '200') {
                if(res.redirect == 'dialog') {
                    parent.layer.closeAll();
                    parent.window.location.reload();
                } else {
                    window.location.reload(res.redirect);
                }
            } else {
                alert(res.msg);
            }
        });
        return false;
    });

    // 删除操作
    $(".btn-delete").click(function(){
        if(!confirm('确定删除该行?')) {
            return false;
        }

        var _ = $(this);
        var url = $(this).attr('data-href');
        $.get(url, function (res) {
            layer.msg(res.msg);
            if(res.code == '200') {
                _.parents("tr").remove();
            }
        });
        return false
    })

    layui.use('upload', function(){
        var upload = layui.upload;
        $(".upload").each(function(i, n){
            var id = $(n).attr("id");
            //执行实例
            var uploadInst = upload.render({
                elem: '#' + id //绑定元素
                ,url: '/admin/ajax/upload' //上传接口
                ,data: {
                    field: function(){
                        return  $(uploadInst.config.elem).attr("data-field");
                    }
                }
                ,done: function(res){
                //上传完毕回调
                if(res.code == '200') {
                    var target = $(this.elem);
                    target.parents("td").find('input[type="text"]').val(res.path);

                    var image = '<img src="' + res.path + '">';
                    target.parents("td").find(".images-box").html(image);
                } else {
                    layer.msg(res.msg);
                }
                }
                ,error: function(){
                //请求异常回调
                }
            });
        })
    });

    layui.use('laydate', function(){
        var laydate = layui.laydate;

        laydate.render({ 
            elem: '#daterange'
            ,type: 'date'
            ,range: '~' //或 range: '~' 来自定义分割字符
        });
    });
})
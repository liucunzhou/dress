$(function(){
    $(".sidebar-menu li").bind({
        click : function() {
            $(".sidebar-menu li").removeClass("active");
            $(this).addClass("active");
        }
    });

    $(".layui-right-side").click(function () {
        var layer = layui.layer;
        var url = $(this).attr('data-action');
        var title = $(this).attr('title');
        var height = window.innerHeight;
        var width = window.innerWidth * 0.6;

        layer.open({
            type: 2,
            title: title,
            content: url,
            area: [width + 'px', height + 'px'],
            offset: 'rb'
        });
    });

    $(".date").datepicker({
        showOtherMonths: true,
        selectOtherMonths: false,
        //isRTL:true,
        /*
        changeMonth: true,
        changeYear: true,

        showButtonPanel: true,
        beforeShow: function() {
            //change button colors
            var datepicker = $(this).datepicker( "widget" );
            setTimeout(function(){
                var buttons = datepicker.find('.ui-datepicker-buttonpane')
                .find('button');
                buttons.eq(0).addClass('btn btn-xs');
                buttons.eq(1).addClass('btn btn-xs btn-success');
                buttons.wrapInner('<span class="bigger-110" />');
            }, 0);
        }
        */
    });

    $(".form-ajax").submit(function () {
        var url = $(this).attr('action');
        var data = $(this).serialize();
        $.post(url, data, function (res) {
            if(res.code == '200') {
                window.location.href = res.redirect;
            } else {
                alert(res.msg);
            }
        });
        return false;
    });
})
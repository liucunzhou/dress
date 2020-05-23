$(function () {
    //做个下简易的验证  大小 格式
    $('#avatarInput').on('change', function(e) {
        var filemaxsize = 1024 * 5;//5M
        var target = $(e.target);
        var Size = target[0].files[0].size / 1024;
        if(Size > filemaxsize) {
            alert('图片过大，请重新选择!');
            $(".avatar-wrapper").children().remove;
            return false;
        }
        if(!this.files[0].type.match(/image.*/)) {
            alert('请选择正确的图片!')
        } else {
            var filename = document.querySelector("#avatar-name");
            var texts = document.querySelector("#avatarInput").value;
            var teststr = texts; //你这里的路径写错了
            testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
            filename.innerHTML = testend;
        }

    });

    $(".avatar-save").on("click", function() {
        var img_lg = document.getElementById('imageHead');
        // 截图小的显示框内的内容
        html2canvas(img_lg, {
            allowTaint: true,
            taintTest: false,
            onrendered: function(canvas) {
                canvas.id = "mycanvas";
                //生成base64图片数据
                var dataUrl = canvas.toDataURL("image/jpeg");
                var newImg = document.createElement("img");
                newImg.src = dataUrl;
                imagesAjax(dataUrl)
            }
        });
    })

    function imagesAjax(src) {
        var data = {};
        data.img = src;
        data.jid = $('#jid').val();
        $.ajax({
            url: "upload-logo.php",
            data: data,
            type: "POST",
            dataType: 'json',
            success: function(re) {
                if(re.status == '1') {
                    $('.user_pic img').attr('src',src );
                }
            }
        });
    }

    $("#preview").click(function () {
        var name = $("#name").val();
        var position = $("#position").val();
        preview(name, position);
    });

    preview();

    function preview(name='', position='') {

        var bg = {
            width: 750,
            height: 750,
            src: "/static/teacher/img/bg.png"
        }

        var logo = {
            width: 233,
            height: 56,
            src: "/static/teacher/img/logo.png"
        }

        var celebrate = {
            width: 220,
            height: 233,
            src: "/static/teacher/img/celebrate.png"
        }

        var flag = {
            width: 683,
            height: 182,
            src: "/static/teacher/img/huizhang.png"
        }

        var teacher = {
            width: 562,
            height: 562,
            src: "/static/teacher/img/teacher.png"
        }

        var imgBg = new Image();
        var imgLogo = new Image();
        var imgCelebrate = new Image();
        // var imgTeacher = new Image();
        var imgFlag = new Image();

        imgBg.src = bg.src;
        imgLogo.src = logo.src;
        imgCelebrate.src = celebrate.src;
        // imgTeacher.src = teacher.src;
        imgFlag.src = flag.src;

        var imgTeacher = new Image();
        var canvas = document.getElementById("canvas");
        var ctx = canvas.getContext("2d");

        imgBg.onload = function () {
            ctx.drawImage(imgBg, 0, 0, bg.width, bg.height);
            // ctx.save();
            // 生成老师背景
            // 红色背景
            ctx.fillStyle = "#ba1200";
            ctx.beginPath();
            ctx.arc(375, 375, 281, 0, Math.PI * 2, false);
            ctx.closePath();
            ctx.fill();
            // 青色背景
            ctx.fillStyle = "#e6e6e6";
            ctx.beginPath();
            ctx.arc(375, 375, 274, 0, Math.PI * 2, false);
            ctx.closePath();
            ctx.fill();

            ctx.drawImage(imgLogo, 38, 38, logo.width, logo.height);
            ctx.drawImage(imgCelebrate, 472, 38, celebrate.width, celebrate.height);
            // ctx.drawImage(imgTeacher, 94, 94, teacher.width + 14, imgTeacher.height + 14);
            ctx.drawImage(imgFlag, 36, 568, imgFlag.width, imgFlag.height);

            ctx.font = "55px Microsoft YaHei";
            ctx.fillStyle = '#1a1a1a';
            var x = 375 - 55 * name.length - 15;
            ctx.fillText(name, x, 652);
            ctx.font = "33px Microsoft YaHei";
            ctx.fillText(position, 375, 652);
            ctx.save();

            var mainImg = new Image();
            var imgSrc = canvas.toDataURL('image/png')
            mainImg.src = imgSrc;
            $('#preview-box').html("");//移除已生成的避免重复生成
            $('#preview-box').append(mainImg);
        }
    }
    
    $("#upload").click(function () {
        $("#avatar-modal").show();
    });
})


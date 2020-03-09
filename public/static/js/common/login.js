$(function(){
  $(".form-login").submit(function () {
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
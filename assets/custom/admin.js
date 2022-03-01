$(document).ready(function(){
    //toastr.options.positionClass = 'toast-top-left';
    $('#login-btn').on('click',function(){
        console.log('click');
        $this = $(this);
        $.ajax({
            url: base_url+"auth/validateLogin",
            type:"post",
            data:$('#user_login_form').serialize(),
            success: function(html){        
                var data = $.parseJSON(html);
                console.log(data);
                if(data.status=='true'){  
                    toastr.success(data.message);
                    window.setTimeout(function(){
                        window.location.href= base_url+'dashboard';
                    },1000);
                }else if(data.status=='false'){
                    toastr.error(data.message);
                }else if(data.status=='error'){
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                }
            }
        });
    });
    $('#login-forgot').on('click',function(){
        var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>Please Wait...';
        $('#login-forgot').html(loader);
        var btn_text        =   "Send";
        $this = $(this);
        $.ajax({
            url: base_url+"auth/resetPassword",
            type:"post",
            data:$('#password-reset').serialize(),
            success: function(html){        
                var data = $.parseJSON(html);
                console.log(data);
                if(data.status=='true'){  
                    toastr.success(data.message);
                    $('#login-forgot').text(btn_text);
                    $('#password-reset')[0].reset();
                }else if(data.status=='false'){
                    toastr.error(data.message);
                    $('#login-forgot').text(btn_text);
                }else if(data.status=='error'){
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                    $('#login-forgot').text(btn_text);
                }
            }
        });
    });
    $('#reset_password').on('click',function(){
        var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>Please Wait...';
        $('#login-forgot').html(loader);
        var btn_text        =   "Submit";
        $this = $(this);
        $.ajax({
            url: base_url+"auth/resetpass",
            type:"post",
            data:$('#reset-pass').serialize(),
            success: function(html){        
                var data = $.parseJSON(html);
                console.log(data);
                if(data.status=='true'){  
                    toastr.success(data.message);
                    $('#reset_password').text(btn_text);
                    $('#reset-pass')[0].reset();
                }else if(data.status=='false'){
                    toastr.error(data.message);
                    $('#reset_password').text(btn_text);
                }else if(data.status=='error'){
                    var message = "";
                    $.each(data.message, function (index, value) {
                        if(value !=''){
                            toastr.error(value);
                        }
                    });
                    $('#reset_password').text(btn_text);
                }
            }
        });
    });
});
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#424242" />
        <title><?php echo get_phrase('lost_your_password'). ' | ' . SMS;  ?></title>
        
        <?php if($this->gsms_setting->favicon_icon){ ?>
            <link rel="icon" href="<?php echo UPLOAD_PATH; ?>/logo/<?php echo $this->gsms_setting->favicon_icon; ?>" type="image/x-icon" />             
        <?php }else{ ?>
            <link rel="icon" href="<?php echo IMG_URL; ?>favicon.ico" type="image/x-icon" />
        <?php } ?>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,100,300,500" />
        <link rel="stylesheet" href="<?php echo VENDOR_URL; ?>usertemplate/assets/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<?php echo VENDOR_URL; ?>usertemplate/assets/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="<?php echo VENDOR_URL; ?>usertemplate/assets/css/form-elements.css" />
        <link rel="stylesheet" href="<?php echo VENDOR_URL; ?>usertemplate/assets/css/style.css" />
        <link rel="stylesheet" href="<?php echo VENDOR_URL; ?>usertemplate/assets/css/jquery.mCustomScrollbar.min.css" />
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery-1.11.1.min.js"></script>
        <style type="text/css">
            .bgwhite{ background: #e4e5e7;
                      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.5);overflow: auto;border-radius: 6px;}
            .llpb20{padding-bottom: 20px;}
            .around40{padding: 40px;}
            .formbottom2{text-align: left;border: 1px solid #e4e4e4;}
            button.btn:hover {opacity: 100 !important; color: #fff;background: #424242;}
            .form-top2 {text-align: left;}
            .img2{width: 100%}
            .spacingmb30{margin-bottom: 30px;}
            .borderR{border-right: 1px solid rgba(66, 66, 66, 0.16);padding: 0px 40px;}
            input[type="text"], input[type="password"], textarea, textarea.form-control {
                height: 40px;border: 1px solid #999;}
            input[type="text"]:focus, input[type="password"]:focus, textarea:focus, textarea.form-control:focus {
                border: 1px solid #424242;}
            button.btn {height: 40px;line-height: 40px;}
            .ispace{ padding-right:5px;}
            .form-top {background:#39f;
                       box-shadow: 0px 7px 12px rgba(0, 0, 0, 0.29);
                       border-bottom: 1px solid rgba(255, 255, 255, 0.19);}
            .form-bottom{background: #39f;box-shadow: 0px 7px 12px rgba(0, 0, 0, 0.29);}
            .font-white{color: #fff;}
            .form-bottom {padding: 25px 25px 15px 25px;}
            button.btn {
                margin: 0;
                padding: 0 20px;
                vertical-align: middle;
                background: #ff9800;
                border: 0;
                font-family: 'Roboto', sans-serif;
                font-size: 16px;
                font-weight: 400;
                color: #fff;
                -moz-border-radius: 4px;
                -webkit-border-radius: 4px;
                border-radius: 4px;
                text-shadow: none;
                -moz-box-shadow: none;
                -webkit-box-shadow: none;
                box-shadow: none;
                -o-transition: all .3s;
                -moz-transition: all .3s;
                -webkit-transition: all .3s;
                -ms-transition: all .3s;
                transition: all .3s;
            }
            button.btn:hover {opacity: 100 !important; color: #fff;background: #fbc02d;}
            a.forgot {padding-top:15px; color: #b0de37;}
            a:hover.forgot {color: #fff; text-decoration: underline;}
            .text-danger {font-size: 13px;}
            .text-danger p {margin-bottom: 0;margin-top: 10px;}
        </style>
    </head>
    <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <div class="">
                                <?php if(isset($this->gsms_setting->logo) && !empty($this->gsms_setting->logo)){ ?>
                                <img  src="<?php echo UPLOAD_PATH.'logo/'.$this->gsms_setting->logo; ?>" style="max-width: 250px; height: 60px;" alt="">
                                <?php }else{ ?>
                                <img  width="100" height="100" src="<?php echo IMG_URL; ?>/sms-logo.png">
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4 col-sm-offset-4 form-box">
                            <div class="form-bottom">
                                <h3 class="font-white bolds"><?= get_phrase('forgot_password');?></h3>
                                <form method="post" action="<?= base_url('auth/resetPassword');?>" id="password-reset" autocomplete="off" onsubmit="return false">
                                    <div class="form-group">
                                        <input type="email" name="email" placeholder="<?= get_phrase('email_address');?>" value="<?= set_value('email');?>" class="form-username form-control" id="email" />
                                        <span class="text-danger"><?php echo form_error('email'); ?></span>
                                    </div>
                                    <button type="submit" class="btn" id="login-forgot"><?= get_phrase('send');?></button>
                                </form>
                                <div class="btn-group btn-group-justified" style="margin-top: 10px;">
                                    
                                <p class="mb0">
                                    <a href="<?= site_url('admin/auth/v1');?>" class="forgot"><i class="fa fa-key"></i> <?= get_phrase('back_to_login');?></a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Javascript -->
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.backstretch.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.mCustomScrollbar.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="<?= VENDOR_URL;?>toast-alert/toastr.js"></script>
        <link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>toast-alert/toastr.css"> 
        <script type="text/javascript">
            var base_url    =   '<?= base_url();?>';
            $(document).ready(function () {
                $.backstretch([base_url + "assets/vendors/usertemplate/assets/img/backgrounds/bg-1.jpg"], { duration: 3000, fade: 750 });
                $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on("focus", function () {
                    $(this).removeClass("input-error");
                });
                $(".login-form").on("submit", function (e) {
                    $(this)
                        .find('input[type="text"], input[type="password"], textarea')
                        .each(function () {
                            if ($(this).val() == "") {
                                e.preventDefault();
                                $(this).addClass("input-error");
                            } else {
                                $(this).removeClass("input-error");
                            }
                        });
                });
            });
        </script>   
        <script type="text/javascript" src="<?= base_url('assets/custom/admin.js');?>"></script>
    </body>
</html>

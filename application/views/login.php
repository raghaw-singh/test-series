<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta name="theme-color" content="#424242" />
        <title><?php echo get_phrase('login'). ' | ' . SMS;  ?></title>
        
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
        <style type="text/css">
            .col-md-offset-3 {
                margin-left: 29%;
            }
            .loginbg {
                background: #39f;
                max-height: 100%;
                box-shadow: 0 10px 18px 0 rgba(62, 57, 107, 0.2);
                border-radius: 4px;
            }

            a.forgot {
                padding-top: 0px;
            }
            a.forgot {
                padding-top: 0px;
                color: #b0de37;
            }
            a:hover.forgot {
                padding-top: 0px;
                color: #fff;
                text-decoration: underline;
            }

            button.btn {
                margin: 0;
                padding: 0 20px;
                vertical-align: middle;
                background: #ff9800;
                border: 0;
                font-family: "Roboto", sans-serif;
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
                -o-transition: all 0.3s;
                -moz-transition: all 0.3s;
                -webkit-transition: all 0.3s;
                -ms-transition: all 0.3s;
                transition: all 0.3s;
            }
            button.btn:hover {
                opacity: 100 !important;
                color: #fff;
                background: #fbc02d;
            }
            .mb0 {
                margin-bottom: 0;
            }
            .form-bottom {
                padding-bottom: 20px;
            }
            @media (max-width: 767px) {
                .col-md-offset-3 {
                    margin-left: 0;
                }
            }
            @media (min-width: 320px) and (max-width: 420px) {
                .ispace {
                    padding-right: 0px;
                    display: block;
                }
                .btn {
                    padding: 6px 0px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Top content -->
        <div class="top-content">
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-5 col-sm-5 col-md-offset-3 form-box">
                            <div class="loginbg">
                                <div class="form-top">
                                    <div class="form-top-left">
                                        <?php if(isset($this->gsms_setting->logo) && !empty($this->gsms_setting->logo)){ ?>
                                        <img  src="<?php echo UPLOAD_PATH.'logo/'.$this->gsms_setting->logo; ?>" style="max-width: 250px; height: 60px;" alt="">
                                        <?php }else{ ?>
                                        <img  width="100" height="100" src="<?php echo IMG_URL; ?>/sms-logo.png">
                                        <?php } ?>
                                    </div>
                                    <div class="form-top-right">
                                        <i class="fa fa-key"></i>
                                    </div>
                                </div>

                                <div class="form-bottom">
                                    <h3 class="font-white bolds"><?= get_phrase('login');?></h3>
                                    <form method="post" action="<?= base_url('auth/validateLogin');?>" id="user_login_form" autocomplete="off" onsubmit="return false">
                                        <div class="form-group">
                                            <input type="email" name="email" placeholder="<?= get_phrase('email_address');?>" value="<?= set_value('email');?>" class="form-username form-control" id="email" />
                                            <span class="text-danger"><?php echo form_error('email'); ?></span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" value="" name="password" placeholder="<?= get_phrase('password');?>" class="form-password form-control" id="password" />
                                            <span class="text-danger"><?php echo form_error('password'); ?></span>
                                        </div>
                                        <button type="submit" class="btn" id="login-btn"><?= get_phrase('sign_in');?></button>
                                    </form>
                                    <div class="btn-group btn-group-justified" style="margin-top: 10px;">
                                        <a
                                            href="#"
                                            class="btn btn-primary width100"
                                            onclick="copy('superadmin@gmail.com', 'superadmin')"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title=""
                                            data-original-title="copy"
                                            style="background: #0084b4;"
                                        >
                                            <i class="fa fa-user-secret ispace"></i>Super Admin
                                        </a>
                                        <a
                                            href="#"
                                            class="btn btn-danger width100"
                                            onclick="copy('raghawsingh@gmail.com', '123456')"
                                            data-toggle="tooltip"
                                            data-placement="top"
                                            title=""
                                            data-original-title="copy"
                                            style="background: #0084b4;"
                                        >
                                            <i class="fa fa-user-secret ispace"></i>Instructor
                                        </a>
                                    </div>

                                    <p class="mb0">
                                        <a href="<?= site_url('forgot');?>" class="forgot"><i class="fa fa-key"></i> <?= get_phrase('forgot_password');?></a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Javascript -->
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery-1.11.1.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.backstretch.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.mCustomScrollbar.min.js"></script>
        <script src="<?php echo VENDOR_URL; ?>usertemplate/assets/js/jquery.mousewheel.min.js"></script>
        <script type="text/javascript" src="<?= VENDOR_URL;?>toast-alert/toastr.js"></script>
        <link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>toast-alert/toastr.css">
    </body>
</html>
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
<script>
    function copy(email, password) {
        document.getElementById("email").value = email;
        document.getElementById("password").value = password;
    }
</script>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, shrink-to-fit=9" />
        <title><?= $title;?></title>

        <?php if(isset($this->setting->favicon_icon) && !empty($this->setting->favicon_icon)){ ?>
        <link rel="icon" type="image/png" href="<?= base_url('uploads/logo/'.$this->setting->favicon_icon);?>" />
        <?php } ?>

        <link href="https://fonts.googleapis.com/css?family=Roboto:400,700,500" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/vendor/unicons-2.0.1/css/unicons.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/css/vertical-responsive-menu.min.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/css/style.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/css/responsive.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/css/night-mode.css" rel="stylesheet" />

        <link href="<?= base_url();?>frontend/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/vendor/OwlCarousel/assets/owl.carousel.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/vendor/OwlCarousel/assets/owl.theme.default.min.css" rel="stylesheet" />
        <link href="<?= base_url();?>frontend/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="<?= base_url();?>frontend/vendor/semantic/semantic.min.css" />
        <style type="text/css">
            .spinner-border.text-primary {
                width: 20px;
                height: 20px;
                color: #fff !important;
            }
        </style>
    </head>
    <body>
        <div class="sign_in_up_bg">
            <div class="container">
                <div class="row justify-content-lg-center justify-content-md-center">
                    <div class="col-lg-12">
                        <div class="main_logo25" id="logo">
                            <?php if(isset($this->setting->front_logo) && !empty($this->setting->front_logo)){ ?>
                            <a href="<?= base_url();?>"><img src="<?= base_url('uploads/logo/'.$this->setting->front_logo);?>" alt="<?= $this->setting->system_name;?>" /></a>
                            <a href="<?= base_url();?>"><img class="logo-inverse" src="<?= base_url('uploads/logo/'.$this->setting->front_logo);?>" alt="<?= $this->setting->system_name;?>" /></a>

                            <?php } ?>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-8">
                        <div class="sign_form">
                            <div class="main-tabs">
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item">
                                        <a href="#student-signup-tab" id="student-tab" class="nav-link active" data-toggle="tab">Student Sign Up</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#instructor-signup-tab" id="instructor-tab" class="nav-link " data-toggle="tab">Instructor Sign Up</a>
                                    </li>
                                    
                                </ul>
                            </div>
                            <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade" id="instructor-signup-tab" role="tabpanel" aria-labelledby="instructor-tab">
                                    <form method="post" action="" id="form_instructor_register" onsubmit="return false" autocomplete="off">
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="text" name="first_name" value="" id="first_name" maxlength="64" placeholder="<?= get_phrase('first_name');?>" />
                                            </div>
                                            <span class="text-danger error_first_name error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="text" name="last_name" value="" id="last_name" maxlength="64" placeholder="<?= get_phrase('last_name');?>" />
                                            </div>
                                            <span class="text-danger error_last_name error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="email" name="email" value="" id="email" maxlength="64" placeholder="<?= get_phrase('email');?>" />
                                            </div>
                                            <span class="text-danger error_email error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="tel" name="phone" value="" id="phone" maxlength="12" placeholder="<?= get_phrase('phone');?>" />
                                            </div>
                                            <span class="text-danger error_email error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="password" name="password" value="" id="id_password"  maxlength="64" placeholder="<?= get_phrase('password');?>" />
                                            </div>
                                            <span class="text-danger error_password error"></span>
                                        </div>
                                        <input type="hidden" name="submit" value="submit">
                                        <button class="login-btn" id="instructor-register" type="submit">Instructor Sign Up Now</button>
                                    </form>
                                </div>
                                <div class="tab-pane fade show active" id="student-signup-tab" role="tabpanel" aria-labelledby="student-tab">
                                    <form autocomplete="off" method="post" id="user_student_form" onsubmit="return false">
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="text" name="first_name" value="" id="first_name" maxlength="64" placeholder="<?= get_phrase('first_name');?>" />
                                            </div>
                                            <span class="text-danger error_first_name error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="text" name="last_name" value="" id="last_name" maxlength="64" placeholder="<?= get_phrase('last_name');?>" />
                                            </div>
                                            <span class="text-danger error_last_name error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="email" name="email" value="" id="email" maxlength="64" placeholder="<?= get_phrase('email');?>" />
                                            </div>
                                            <span class="text-danger error_email error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="tel" name="phone" value="" id="phone" maxlength="12" placeholder="<?= get_phrase('phone');?>" />
                                            </div>
                                            <span class="text-danger error_email error"></span>
                                        </div>
                                        <div class="ui search focus mt-15">
                                            <div class="ui left icon input swdh11 swdh19">
                                                <input class="prompt srch_explore" type="password" name="password" value="" id="id_password"  maxlength="64" placeholder="<?= get_phrase('password');?>" />
                                            </div>
                                            <span class="text-danger error_password error"></span>
                                        </div>
                                        <!-- <div class="ui form mt-30 checkbox_sign">
                                            <div class="inline field">
                                                <div class="ui checkbox mncheck">
                                                    <input type="checkbox" tabindex="0" class="hidden" />
                                                    <label>I’m in for emails with exciting discounts and personalized recommendations</label>
                                                </div>
                                            </div>
                                        </div> -->
                                        <input type="hidden" name="submit" value="sumit">
                                        <button class="login-btn btn-register" type="submit">Student Sign Up Now</button>
                                    </form>
                                </div>
                            </div>
                            <p class="mb-0 mt-30">Already have an account? <a href="<?= base_url('auth/v1/login');?>">Log In</a></p>
                        </div>
                        <div class="sign_footer">© <?= $this->setting->footer;?></div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<?= base_url();?>frontend/js/jquery-3.3.1.min.js"></script>
        <script src="<?= base_url();?>frontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<?= base_url();?>frontend/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="<?= base_url();?>frontend/vendor/semantic/semantic.min.js"></script>
        <script src="<?= base_url();?>frontend/js/custom.js"></script>
        <script src="<?= base_url();?>frontend/js/night-mode.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script type="text/javascript">
            var base_url    =   '<?= base_url();?>';
            $('.btn-register').on('click',function(){
                $('.btn-register').attr('disabled',true);
                //toastr.options.positionClass = 'toast-top-left';
                var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div> Please Wait...';
                $('.btn-register').html(loader);
                $this = $(this);
                $.ajax({
                    url: base_url+"create-student-account",
                    type:"post",
                    data:$('#user_student_form').serialize(),
                    success: function(html){        
                        var data = $.parseJSON(html);
                        if(data.status=='true'){  
                            toastr.success(data.message);
                            $('.btn-register').attr('disabled',false);
                            $('.btn-register').html('Student Sign Up Now');
                            window.location.href=base_url+'auth/v1/login';
                        }else if(data.status=='false'){
                            toastr.error(data.message);
                            $('.btn-register').attr('disabled',false);
                            $('.btn-register').html('Student Sign Up Now');
                        }else if(data.status=='error'){
                            var message = "";
                            $.each(data.message, function (index, value) {
                                if(value !=''){
                                    toastr.warning(value);
                                }
                            });
                            $('.btn-register').attr('disabled',false);
                            $('.btn-register').html('Student Sign Up Now');
                        }
                    }
                });
            })
            $('#instructor-register').on('click',function(){
                $('#instructor-register').attr('disabled',true);
                //toastr.options.positionClass = 'toast-top-left';
                var loader  =   '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div> Please Wait...';
                $('#instructor-register').html(loader);
                $this = $(this);
                $.ajax({
                    url: base_url+"create-instructor-account",
                    type:"post",
                    data:$('#form_instructor_register').serialize(),
                    success: function(html){        
                        var data = $.parseJSON(html);
                        if(data.status=='true'){  
                            toastr.success(data.message);
                            $('#instructor-register').attr('disabled',false);
                            $('#instructor-register').html('Instructor Sign Up Now');
                            window.location.href=base_url+'mobile-verification';
                        }else if(data.status=='false'){
                            toastr.error(data.message);
                            $('#instructor-register').attr('disabled',false);
                            $('#instructor-register').html('Instructor Sign Up Now');
                        }else if(data.status=='error'){
                            var message = "";
                            $.each(data.message, function (index, value) {
                                if(value !=''){
                                    toastr.warning(value);
                                }
                            });
                            $('#instructor-register').attr('disabled',false);
                            $('#instructor-register').html('Instructor Sign Up Now');
                        }
                    }
                });
            })
        </script>
    </body>
</html>

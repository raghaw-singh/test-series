<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, shrink-to-fit=9" />
        <meta name="description" content="Gambolthemes" />
        <meta name="author" content="Gambolthemes" />
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
                            <form method="post" onsubmit="return false" autocomplete="off" id="user_forgot_form">
                                <div class="ui search focus mt-15">
                                    <div class="ui left icon input swdh95">
                                        <input class="prompt srch_explore" type="email" name="emailaddress" id="id_email" maxlength="64" placeholder="Email Address" />
                                        <i class="uil uil-envelope icon icon2"></i>
                                    </div>
                                </div>
                                <input type="hidden" name="submit" value="submit">
                                <button class="login-btn" type="submit">Submit</button>
                            </form>
                            <p class="mb-0 mt-30 hvsng145"><a href="<?= base_url('auth/v1/login');?>">Back to login</a></p>
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
            var base_url            =   '<?= base_url();?>';
            $(document).ready(function(){
                $(document).on('click', '.login-btn', function (e) {
                    var loader          =   '<div class="spinner-border text-success" role="status"><span class="sr-only">Loading...</span></div>   Processing...';
                    var $this = $(this);
                    $('.login-btn').html(loader);
                    $.ajax({
                        url: "<?= base_url('web/auth/forgotPassword');?>",
                        type: 'post',
                        data: $('#user_forgot_form').serialize(),
                        dataType: 'json',
                        success: function (data) {
                            console.log(data);
                            if (data.status =='error') {
                                var message = "";
                                $.each(data.message, function (index, value) {
                                    if(value !=''){
                                        toastr.warning(value);
                                    }
                                });
                                $('.login-btn').text('Submit');
                            } else {
                                $('.login-btn').text('Submit');
                                toastr.success(data.message);
                                $('#user_forgot_form')[0].reset();
                            }
                        }
                    });
                });
            })
        </script>
        <style type="text/css">
            .spinner-border.text-success {
                width: 20px;
                height: 20px;
            }
        </style>
    </body>
</html>

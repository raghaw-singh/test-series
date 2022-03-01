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
                    <div class="col-lg-6 col-md-8" id="app">
                        <div class="sign_form">
                            <form autocomplete="off" method="post" id="otp_validate" onsubmit="return false">
                                <div id="app">
                                    <div class="height-100 d-flex justify-content-center align-items-center">
                                        <div class="position-relative">
                                            <div class="text-center">
                                                <h6>Please enter the one time password <br> </h6>
                                                <div> <span> sent to</span> <small> <?= censor_word($mobile,3,'*');?></small> </div>
                                                <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2"> 
                                                    <input class="m-2 text-center form-control rounded" type="text" id="input1" v-on:keyup="inputenter(1)" maxlength="1" /> 
                                                    <input class="m-2 text-center form-control rounded" v-on:keyup="inputenter(2)" type="text" id="input2" maxlength="1" /> 
                                                    <input class="m-2 text-center form-control rounded" v-on:keyup="inputenter(3)" type="text" id="input3" maxlength="1" /> 
                                                    <input class="m-2 text-center form-control rounded" v-on:keyup="inputenter(4)" type="text" id="input4" maxlength="1" /> 
                                                    <input class="m-2 text-center form-control rounded" v-on:keyup="inputenter(5)" type="text" id="input5" maxlength="1" /> 
                                                    <input class="m-2 text-center form-control rounded" v-on:keyup="inputenter(6)" type="text" id="input6" maxlength="1" /> 
                                                </div>
                                                <div class="mt-4"> 
                                                    <input type="hidden" name="submit" value="sumit">
                                                    <button class="btn btn-danger px-4 validate" id="getverify">Validate</button>
                                                </div>
                                                <div class="mt-3 content d-flex justify-content-center align-items-center"> 
                                                    <span>Didn't get the code </span> 
                                                    <a href="javascript:;" class="text-decoration-none ms-3">&nbsp;<?= get_phrase('resend');?></a> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p class="mb-0 mt-30"><a href="<?= base_url('auth/v1/login');?>">Skip to verify </a></p>
                            </form>
                            <p class="mb-0 mt-30">Already have an account? <a href="<?= base_url('auth/v1/login');?>">Log In</a></p>
                        </div>
                        <div class="sign_footer">© <?= $this->setting->footer;?></div>
                    </div>
                </div>
            </div>
        </div>

        <script src="<?= base_url();?>frontend/js/jquery-3.3.1.min.js"></script>
        <script src="<?= base_url();?>frontend/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="<?= base_url();?>frontend/vendor/semantic/semantic.min.js"></script>
        <script src="<?= base_url();?>frontend/vendor/OwlCarousel/owl.carousel.js"></script>
        <script src="<?= base_url();?>frontend/js/custom.js"></script>
        <script src="<?= base_url();?>frontend/js/night-mode.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue@2.6.12/dist/vue.js"></script>
        <script type="text/javascript">
            var base_url    =   '<?= base_url();?>';
            $(document).ready(function(){
                $("#getverify").on('click',function(e) {
                    console.log('verify');
                    var otp1 = $("#input1").val();
                    var otp2 = $("#input2").val();
                    var otp3 = $("#input3").val();
                    var otp4 = $("#input4").val();
                    var otp5 = $("#input5").val();
                    var otp6 = $("#input6").val();
                    
                    var otp = otp1.toString() + otp2.toString() + otp3.toString() + otp4.toString() + otp5.toString() + otp6.toString();
                    
                    if (otp.length == 6 && otp != null) {
                    //$(".loader").show();  
                        $.ajax({
                            url: '<?= base_url('web/auth/validateOTP');?>',
                            type:'post',
                            data:{'otp':otp},
                            success:function(data){
                                var get_res     =   $.parseJSON(data);
                                console.log(get_res);
                                if(get_res.status=='true'){
                                    toastr.success(get_res.message);
                                    window.location.href = base_url+'auth/v1/login';
                                }else if(get_res.status=='false'){
                                    toastr.warning(get_res.message);
                                }else{
                                    toastr.warning(get_res.message);
                                }
                            },
                        });
                    }else{
                        toastr.warning('OTP missing');
                    }
                    e.preventDefault(); // avoid to execute the actual submit of the form.
                });
            })
            var app = new Vue({
            el: '#app',
            methods: {
            inputenter(id) {

            const inputs = document.querySelectorAll('#otp > *[id]');
            for (let i = 0; i < inputs.length; i++) { inputs[i].addEventListener('keydown', function(event) { if (event.key==="Backspace" ) { inputs[i].value='' ; if (i !==0) inputs[i - 1].focus(); } else { if (i===inputs.length - 1 && inputs[i].value !=='' ) { return true; } else if (event.keyCode> 47 && event.keyCode < 58) { inputs[i].value=event.key; if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } else if (event.keyCode> 64 && event.keyCode < 91) { inputs[i].value=String.fromCharCode(event.keyCode); if (i !==inputs.length - 1) inputs[i + 1].focus(); event.preventDefault(); } } }); } } } });
        </script>
    </body>
</html>

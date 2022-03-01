<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title><?php echo $title_for_layout; ?></title>
        <?php if($this->gsms_setting->favicon_icon){ ?>
            <link rel="icon" href="<?php echo base_url(); ?>uploads/logo/<?php echo $this->gsms_setting->favicon_icon; ?>" type="image/x-icon" />             
        <?php }else{ ?>
            <link rel="icon" href="<?php echo IMG_URL; ?>favicon.ico" type="image/x-icon" />
        <?php } ?>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
        <meta name="theme-color" content="#5190fd" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/style-main.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/jquery.mCustomScrollbar.min.css" />
        <?php if($this->gsms_setting->theme_name=='default'){ ?>
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/themes/default/skins/_all-skins.min.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/themes/default/ss-main.css" />
        <?php } else{?>
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/themes/<?= $this->gsms_setting->theme_name;?>/skins/skin-<?= $this->gsms_setting->theme_name;?>.css">
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/themes/<?= $this->gsms_setting->theme_name;?>/ss-main-<?= $this->gsms_setting->theme_name;?>.css">
        <?php } ?>
        <link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/icons.min.css');?>">
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/all.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/font-awesome.min.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/ionicons.min.css" />

        <!-- <link href="https://demo.itest.inilabs.xyz/assets/fonts/icomoon.css" rel="stylesheet">
        <link href="https://demo.itest.inilabs.xyz/assets/fonts/ini-icon.css" rel="stylesheet"> -->
        
        <link rel="stylesheet" href="<?= VENDOR_URL;?>plugins/iCheck/flat/blue.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>plugins/morris/morris.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>plugins/jvectormap/jquery-jvectormap-1.2.2.css" />
        <link rel="stylesheet" href="<?= VENDOR_URL;?>dist/css/custom_style.css" />
        <!--file dropify-->
        <link rel="stylesheet" type="text/css" href="<?= base_url('assets/css/custom.css');?>">
        <!--file nprogress-->
        <link href="<?= VENDOR_URL;?>dist/css/nprogress.css" rel="stylesheet" />
        <!--print table-->
        

        <script src="<?= VENDOR_URL;?>custom/jquery.min.js"></script>
        <script type="text/javascript" src="<?= base_url('assets/js/jquery.validate.js');?>"></script>

        <link href="<?= VENDOR_URL;?>dist/datatables/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="<?= VENDOR_URL;?>dist/datatables/css/buttons.dataTables.min.css" rel="stylesheet">
        <link href="<?= VENDOR_URL;?>dist/datatables/css/dataTables.bootstrap.min.css" rel="stylesheet">

        <!-- <link rel="stylesheet" href="https://demo.itest.inilabs.xyz/assets/datatables/buttons.dataTables.min.css" >
        <link id="headInilabsCSSLink" href="https://demo.itest.inilabs.xyz/assets/inilabs/themes/default/inilabs.css" rel="stylesheet"> -->

        <!--print table mobile support-->
        <script type="text/javascript" src="<?= VENDOR_URL;?>dist/datatables/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" src="<?= VENDOR_URL;?>dist/datatables/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="<?= VENDOR_URL;?>dist/datatables/js/dataTables.responsive.min.js" ></script>
        <style type="text/css">
            .error{color: red;}
            i.dripicons {margin-right: 5px;}
            img.user-photo {
                width: 36px;
                border-radius: 100%;
            }
            .btn{padding: 4px 11px !important;}
        </style>
    </head>
    <script type="text/javascript">
        var baseurl = "<?= base_url();?>";
    </script>
    <body class="hold-transition skin-blue fixed sidebar-mini" data-layout="detached">
        <script type="text/javascript">
            
            function collapseSidebar() {
                if (Boolean(sessionStorage.getItem("sidebar-toggle-collapsed"))) {
                    sessionStorage.setItem("sidebar-toggle-collapsed", "");
                } else {
                    sessionStorage.setItem("sidebar-toggle-collapsed", "1");
                }
            }

            function checksidebar() {
                if (Boolean(sessionStorage.getItem("sidebar-toggle-collapsed"))) {
                    var body = document.getElementsByTagName("body")[0];
                    body.className = body.className + " sidebar-collapse";
                }
            }
            checksidebar();
        </script>
        <div class="wrapper">
            <?php $this->load->view('layout/header');?>
            <?php $this->load->view('layout/left-side');?>
            <div class="content-wrapper">
                <section class="content">
                    <?php $this->load->view('layout/message'); ?>
                    <!-- page content -->
                    <?php echo $content_for_layout; ?>
                </section>
            </div>
                    <!--./row-->
            <script src="<?= VENDOR_URL;?>dist/js/moment.min.js"></script>
            <?php $this->load->view('layout/footer');?>
            <div class="control-sidebar-bg"></div>
        </div>

        <link href="<?= VENDOR_URL;?>toast-alert/toastr.css" rel="stylesheet" />
        <script src="<?= VENDOR_URL;?>toast-alert/toastr.js"></script>
        <script src="<?= VENDOR_URL;?>bootstrap/js/bootstrap.min.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/select2/select2.full.min.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/input-mask/jquery.inputmask.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/input-mask/jquery.inputmask.extensions.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/daterangepicker/daterangepicker.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/slimScroll/jquery.slimscroll.min.js"></script>
        <script src="<?= VENDOR_URL;?>dist/js/jquery.mCustomScrollbar.concat.min.js"></script>
        <!--language js-->
        <script type="text/javascript" src="<?= VENDOR_URL;?>dist/js/bootstrap-select.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".studentsidebar").mCustomScrollbar({
                    theme: "minimal",
                });

                $(".studentsideclose, .overlay").on("click", function () {
                    $(".studentsidebar").removeClass("active");
                    $(".overlay").fadeOut();
                });

                $("#sidebarCollapse").on("click", function () {
                    $(".studentsidebar").addClass("active");
                    $(".overlay").fadeIn();
                    $(".collapse.in").toggleClass("in");
                    $("a[aria-expanded=true]").attr("aria-expanded", "false");
                });
            });
            
        </script>
        <script src="<?= VENDOR_URL;?>plugins/iCheck/icheck.min.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/datepicker/bootstrap-datepicker.js"></script>
        <script src="<?= VENDOR_URL;?>dist/js/moment.min.js"></script>
        <script src="<?= VENDOR_URL;?>datepicker/js/bootstrap-datetimepicker.js"></script>
        <script src="<?= VENDOR_URL;?>plugins/fastclick/fastclick.min.js"></script>
        <script src="<?= VENDOR_URL;?>dist/js/app.min.js"></script>
        <!--nprogress-->
        <script src="<?= VENDOR_URL;?>dist/js/nprogress.js"></script>
        <div class="modal fade" id="customModelLarge" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    
                </div>
            </div>
        </div>
        <div class="modal fade" id="ajaxModalSM" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    
                </div>
            </div>
        </div>
        <div class="modal fade" id="ajaxModalMD" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    
                </div>
            </div>
        </div>
        <div class="modal fade" id="ajaxModalLG" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function ajaxModalSM(url, header,modal_class){
                jQuery('#ajaxModalSM .modal-body').html('<div style="text-align:center;"><img src="<?= base_url('assets/images/bg-pattern-light.svg');?>" /></div>');
                jQuery('#ajaxModalSM .modal-title').html('...');
                jQuery('#ajaxModalSM').modal('show', {backdrop: 'true'});
                $.ajax({
                    url: url,
                    success: function(response)
                    {
                        jQuery('#ajaxModalSM .modal-content').html(response);
                        jQuery('#ajaxModalSM .modal-title').html(header);
                        jQuery('#ajaxModalSM').addClass(modal_class);
                    }
                });
            }
            function ajaxModalMD(url, header,modal_class){
                jQuery('#ajaxModalMD .modal-body').html('<div style="text-align:center;"><img src="<?= base_url('assets/images/bg-pattern-light.svg');?>" /></div>');
                jQuery('#ajaxModalMD .modal-title').html('...');
                jQuery('#ajaxModalMD').modal('show', {backdrop: 'true'});
                $.ajax({
                    url: url,
                    success: function(response)
                    {
                        jQuery('#ajaxModalMD .modal-content').html(response);
                        jQuery('#ajaxModalMD .modal-title').html(header);
                        jQuery('#ajaxModalMD').addClass(modal_class);
                    }
                });
            }
            function ajaxModalLG(url, header,modal_class){
                jQuery('#ajaxModalLG .modal-body').html('<div style="text-align:center;"><img src="<?= base_url('assets/images/bg-pattern-light.svg');?>" /></div>');
                jQuery('#ajaxModalLG .modal-title').html('...');
                jQuery('#ajaxModalLG').modal('show', {backdrop: 'true'});
                $.ajax({
                    url: url,
                    success: function(response)
                    {
                        jQuery('#ajaxModalLG .modal-content').html(response);
                        jQuery('#ajaxModalLG .modal-title').html(header);
                        jQuery('#ajaxModalLG').addClass(modal_class);
                    }
                });
            }
            $(".only_number").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                     // Allow: Ctrl+A, Command+A
                    (e.keyCode == 65 && ( e.ctrlKey === true || e.metaKey === true ) ) || 
                     // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    return;
                }
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });
            $(".only_text").keypress(function(event){
                var inputValue = event.which;
                // allow letters and whitespaces only.
                if((inputValue > 47 && inputValue < 58) && (inputValue != 32)){
                    event.preventDefault();
                }
            }); 
        </script>
    </body>
</html>
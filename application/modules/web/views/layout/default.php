<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><?php echo $title_for_layout; ?></title>        
        <?php if(isset($this->setting->favicon_icon) && !empty($this->setting->favicon_icon)){ ?>
        <link rel="icon" type="image/png" href="<?= base_url('uploads/logo/'.$this->setting->favicon_icon);?>" />
        <?php } ?>

    <link rel="stylesheet" href="<?= base_url();?>website/bootstrap-cdn/css/bootstrap.min.css">
    <script type="text/javascript" src="<?= base_url();?>/website/bootstrap-cdn/js/bootstrap.bundle.min.js"></script>
    <!--font-awesome  -->
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <!-- custom css -->
    <link rel="stylesheet" href="<?= base_url();?>website/css/style.css" />
    <link rel="stylesheet" type="text/css" href="<?= base_url('website/css/guintabus.css');?>">
    <link rel="stylesheet" type="text/css" href="<?= base_url('website/css/contactti.css');?>">
    <link rel="stylesheet" type="text/css" href="<?= base_url('website/css/messina.css');?>">
    <link rel="stylesheet" type="text/css" href="<?= base_url('website/css/MilazzoAeroportoCatania.css');?>">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="<?= base_url();?>website/js/jquery.js"></script>
    <script src="<?= base_url();?>website/js/script.js"></script>

    <link
        href="https://fonts.googleapis.com/css2?family=Abril+Fatface&family=Raleway:ital,wght@0,100;0,200;1,100;1,200&display=swap"
        rel="stylesheet">
    <title>home</title>
</head>

<body>
    <div class="main-page">
        <?php $this->load->view('layout/header');?>
        <?php echo $content_for_layout; ?>
        <?php $this->load->view('layout/footer');?>
    </div>

    <!-- modal for search -->

    <!-- Modal -->
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">

                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="exampleFormControlInput1" class="form-label"></label>
                            <input type="search" class="form-control" id="exampleFormControlInput1"
                                placeholder="Search">
                        </div>
                    </form>
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-primary text-center">Submit</button>
                </div>

            </div>
        </div>
    </div>
    <!-- end -->

</body>

</html>
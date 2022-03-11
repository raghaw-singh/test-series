
<div class="row">
    <div class="col-lg-2 col-md-3 col-sm-6 col20">
        <div class="info-box">
            <a href="javascript:;">
                <span class="info-box-icon bg-green"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"> student</span>
                    <span class="info-box-number"><?= $student_count ;?></span>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-2 col-md-3 col-sm-6 col20">
        <div class="info-box">
            <a href="javascript:;">
                <span class="info-box-icon bg-green"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"> teacher</span>
                    <span class="info-box-number"><?= $teacher_count ;?></span>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-2 col-md-3 col-sm-6 col20">
        <div class="info-box">
            <a href="javascript:;">
                <span class="info-box-icon bg-green"><i class="fa fa-cubes"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"> <?= get_phrase('subject');?></span>
                    <span class="info-box-number">4</span>
                </div>
            </a>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <section class="panel">
            <div class="profile-db-head bg-maroon-light">
                <a href="https://demo.itest.inilabs.xyz/profile/index"> 
                    <?php $photo     =    $this->session->userdata('photo');
                    if(!empty($photo)){ ?>
                    <img src="<?= base_url('uploads/student_image/'.$photo);?>" />
                    <?php } else{?>
                    <img src="<?= base_url('uploads/no-image.png');?>" />
                    <?php } ?>
                </a>

                <h1><?= $this->session->userdata('name') ;?></h1>
                <p>Student</p>
            </div>
            <table class="table table-hover">
                <tbody>
                    
                    <tr>
                        <td>
                            <i class="fa fa-envelope text-maroon-light"></i>
                        </td>
                        <td><?= get_phrase('email');?></td>
                        <td><?= $this->session->userdata('email') ;?></td>
                    </tr>
                    <tr>
                        <td>
                            <i class="fa fa-phone text-maroon-light"></i>
                        </td>
                        <td><?= get_phrase('phone');?></td>
                        <td><?= $this->session->userdata('phone') ;?></td>
                    </tr>
                    
                </tbody>
            </table>
        </section>

    </div>
</div>
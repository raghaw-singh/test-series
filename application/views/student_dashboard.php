
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
                <span class="info-box-icon bg-green"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"> subject</span>
                    <span class="info-box-number">4</span>
                </div>
            </a>
        </div>
    </div>
    <div class="col-lg-2 col-md-3 col-sm-6 col20">
        <div class="info-box">
            <a href="javascript:;">
                <span class="info-box-icon bg-green"><i class="fas fa-users"></i></span>
                <div class="info-box-content">
                    <span class="info-box-text"> group</span>
                    <span class="info-box-number">2</span>
                </div>
            </a>
        </div>
    </div>
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= $this->session->userdata('name') ;?></h3>            </div>
            <div class="box-body">
                <div class="mailbox-controls"></div>
                <div class="table-responsive mailbox-messages">
                    <table class="table table-bordered table-hover table-striped">
                        <tbody>
                            <tr>
                                <td><strong>Phone</strong></td>
                                <td class="mailbox-name"><?= $this->session->userdata('phone') ;?></td>
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>
                                <td class="mailbox-name"><?= $this->session->userdata('email') ;?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <hr style="width: 98.9%; margin: 32px auto 20px;" />
                    <div class="col-md-12 col-sm-12">
                        <label for="input-type">Photo</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <?php 
                            $photo     =    $this->session->userdata('photo');
                            if(!empty($photo)){ ?>
                        <img style=" border-radius: 100px; width: 67%;" class="img-responsive radioborder" src="<?= base_url('uploads/student_image/'.$photo);?>" /><?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
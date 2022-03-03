<div class="row">
    <div class="col-md-7">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Teachers</h3>
                <div class="box-tools pull-right">
                    <div class="has-feedback">
                    </div>
                </div>
            </div>
            <div class="box-body">
                <div class="mailbox-controls"></div>
                <div class="table-responsive mailbox-messages">
                    <table class="table table-bordered table-hover table-striped">
                        <tbody>
                            <tr>
                                <td><strong>Teacher Name</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->name ; ?></td>
                            </tr>
                            <tr>
                                <td><strong>date of Birth</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->date_of_birth ; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Address</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->address ; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Phone</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->phone ; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Email</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->email ; ?></td>
                            </tr>
                            <tr>
                                <td><strong>Date Of Joining</strong></td>
                                <td class="mailbox-name"><?= $teacher_info->joining_date ; ?></td>
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
                        <?php if(!empty($teacher_data->photo)){ ?>
                        <img class="img-responsive radioborder" src="<?= base_url('uploads/teacher_image/'.$teacher_data->photo);?>" /><?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--./col-md-9-->
</div>

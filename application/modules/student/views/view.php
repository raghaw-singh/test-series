<div class="row">
    <div class="col-md-7">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= get_phrase('student'); ?></h3>
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
                                <td><strong><?= get_phrase('student_name'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->first_name.' '.$studentData->last_name ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('date_of_birth'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->date_of_birth ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('address'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->address ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('phone'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->phone ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('email'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->email ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('class'); ?></strong></td>
                                <td class="mailbox-name"><?= $this->db->get_where('class',array('id'=>$studentData->class))->row()->class ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('section'); ?></strong></td>
                                <td class="mailbox-name"> <?= $this->db->get_where('section',array('id'=>$studentData->section))->row()->section ; ?></td>
                            </tr>
                            <tr>
                                <td><strong><?= get_phrase('roll_no'); ?></strong></td>
                                <td class="mailbox-name"><?= $studentData->roll ; ?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <hr style="width: 98.9%; margin: 32px auto 20px;" />
                    <div class="col-md-12 col-sm-12">
                        <label for="input-type"><?= get_phrase('photo');?></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-6">
                        <?php if(!empty($studentData->photo)){ ?>
                        <img class="img-responsive radioborder" src="<?= base_url('uploads/student_image/'.$studentData->photo);?>" /><?php } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--./col-md-9-->
</div>

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('student');?></h3>
                <?php if(has_permission(VIEW,'hrm','users')){?>
                <div class="pull-right">
                    <a href="<?= base_url('student/student/add');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('student');?></a>
                </div>
                <?php } ?>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Sr No</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Roll No</th>
                            <?php if(has_permission(VIEW,'hrm','users')){?>
                            <th>Status</th>
                            <?php } ?>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($studentData as  $student_info) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $student_info->first_name.' '.$student_info->last_name; ?></td>
                            <td><?= $student_info->email; ?></td>
                            <td><?= $student_info->roll; ?></td>
                            <?php if(has_permission(VIEW,'hrm','users')){?>
                            <td><select onchange="changeStatus(this.value,'<?= $student_info->id;?>')" name="status">
                                    <option value="1" <?php if( $student_info->status=='1') echo 'selected';?>>Active</option>
                                    <option value="0" <?php if( $student_info->status=='0') echo 'selected';?>>Inactive</option>
                                </select>
                            </td>
                            <?php } ?>
                            <td>
                                <a href="<?= base_url('student/view/'.$student_info->user_id) ;?>" class="btn btn-success btn-xs"><i class="fa fa-folder-open-o"></i> View</a>

                                <?php if(has_permission(VIEW,'hrm','users')){?>
                                <a href="<?= base_url('student/edit/'.$student_info->user_id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>

                                <a onclick="ajaxModalSM('<?= base_url('student/deleteModal/'.$student_info->user_id);?>','<?= get_phrase('delete_confirmation');?>','teacher_delete_modal')" href="javascript:;" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>
                                <?php } ?>
                            </td>
                        </tr>
                    </tbody><?php $count ++ ;  }   ?>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var base_url    =   '<?= base_url();?>';
    function changeStatus(status,id) {
        $.ajax({
            type: "POST",
            url: base_url+"student/update_status",
            data: {status:status,id:id},
            success: function(html){   
                console.log(html);       
                var data = $.parseJSON(html);
                if(data.status=='true'){  
                    toastr.success(data.message);
                }  
            }
        });
    }
    $('#datatable-responsive').DataTable();
</script>
<!-- page content -->
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix">Manage Teachers</h3>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab_teacher_list" role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> Teachers List</a>
                </li>
                <?php if(has_permission(VIEW, 'hrm','users')){?>
                <li class="">
                    <a href="#tab_add_teacher" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> Add Teacher</a>
                </li>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab_teacher_list">
                    <div class="x_content">
                        <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>Sr No</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <?php if(has_permission(VIEW,'hrm','users')){?>
                                    <th>Status</th>
                                    <?php } ?>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <?php $count=1; foreach ($teacherData as  $teacher_info) {  ?>
                            <tbody>
                                <tr>
                                    <td><?= $count ;?></td>
                                    <td><?= $teacher_info->name; ?></td>
                                    <td><?= $teacher_info->email; ?></td>
                                    <?php if(has_permission(VIEW,'hrm','users')){?>
                                    <td><select onchange="changeStatus(this.value,'<?= $teacher_info->id;?>')" name="status">
                                            <option value="1" <?php if( $teacher_info->status=='1') echo 'selected';?>>Active</option>
                                            <option value="0" <?php if( $teacher_info->status=='0') echo 'selected';?>>Inactive</option>
                                        </select>
                                    </td>
                                    <?php } ?>
                                    <td>
                                        <a href="<?= base_url('teacher/view/'.$teacher_info->user_id) ;?>" class="btn btn-success btn-xs"><i class="fa fa-folder-open-o"></i> View</a>
                                        <?php if(has_permission(VIEW,'hrm','users')){?>
                                        <a href="<?= base_url('teacher/edit/'.$teacher_info->user_id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>

                                        <a onclick="ajaxModalSM('<?= base_url('teacher/deleteModal/'.$teacher_info->user_id);?>','<?= get_phrase('delete_confirmation');?>','teacher_delete_modal')" href="javascript:;" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>
                                        <?php } ?>
                                    </td>
                                </tr>
                            </tbody><?php $count ++ ;  }   ?>
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade in" id="tab_add_teacher">
                    <div class="x_content">
                        <form method="post" id="register_form" autocomplete="off" class="form-horizontal form-label-left" onsubmit="return false" accept-charset="utf-8">
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('name');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" name="name" type="text" />
                                    <span class="text-danger"><?= form_error('name'); ?></span>
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('designation');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="designation" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('date of birth');?> <span class="required">*</span> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input class="form-control col-md-7 col-xs-12" id="dob" type="text" name="date_of_birth" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?= get_phrase('gender');?> </label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="gender" class="form-control col-md-7 col-xs-12">
                                        <option value="male">male</option>
                                        <option value="female">female</option>
                                    </select>    
                                    <div class="help-block"></div>
                                </div>
                            </div>    
                            <div class="ln_solid"></div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('religion');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="religion" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('email');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="email" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('phone');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="phone" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('address');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="address" class="form-control col-md-7 col-xs-12" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('joining date');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="date_of_joining" class="form-control col-md-7 col-xs-12 " id="doj" type="text" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12" ><?= get_phrase('photo');?></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="image" type="file" class="form-control" style="opacity: 10; border: 1px groove; outline: 1px" />
                                </div>
                            </div>
                            <div class="item form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12"><?= get_phrase('password');?> <span class="required">*</span></label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="password" class="form-control col-md-7 col-xs-12" type="password" />
                                    <div class="help-block"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-6 col-md-offset-3">
                                    <a href="<?= base_url('teacher');?>" class="btn btn-primary">Cancel</a>
                                    <button type="submit" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>datepicker/css/bootstrap-datetimepicker.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>datepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript">

    $('#dob').datepicker();
    $('#doj').datepicker();

    var base_url    =   '<?= base_url();?>';
    $('#register_form').on('submit',function(){
        $this = $(this);
        $.ajax({
            url: base_url+"teacher/add_teacher",
            type:"post",
            //data:$('#setting-form').serialize(),
            data:  new FormData(this),
            contentType: false,
            cache: false,
            processData:false,
            success: function(response){        
                var getRes = $.parseJSON(response);
                console.log(getRes);
                if(getRes.status=='true'){  
                    toastr.success(getRes.message);
                    window.setTimeout(function(){
                        window.location.reload();
                    },1000);
                }else if(getRes.status=='false'){
                    toastr.error(getRes.message);
                }else if(getRes.status=='error'){
                    var message = "";
                    $.each(getRes.message, function (index, value) {
                        if(value !=''){
                            toastr.warning(value);
                        }
                    });
                }
            }
        });
    })
</script>
<script type="text/javascript">
    var base_url    =   '<?= base_url();?>';
    function changeStatus(status,id) {
        $.ajax({
            type: "POST",
            url: base_url+"teacher/update_status",
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

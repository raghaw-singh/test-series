<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('user').' '.get_phrase('credential');?></h3>
                <div class="box-tools pull-right">
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <?php echo form_open_multipart(site_url('administrator/usercredential/index'), array('name' => 'user', 'id' => 'user'), ''); ?>
                    <div class="row">
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <div class="item form-group"> 
                                <div><?php echo get_phrase('user'); ?> <?php echo get_phrase('type'); ?> <span class="required"> *</span></div>
                                <select  class="form-control col-md-7 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_user_by_role(this.value, '', '');">
                                    <option value="">--<?php echo get_phrase('select'); ?>--</option> 
                                    <?php foreach($roles as $obj ){ ?>
                                    <option value="<?php echo $obj->id; ?>" <?php if(isset($role_id) && $role_id == $obj->id){ echo 'selected="selected"'; } ?>><?php echo $obj->name; ?></option>
                                    <?php } ?>                                            
                                </select>
                                <div class="help-block"><?php echo form_error('role_id'); ?></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="item form-group"> 
                                <div><?php echo get_phrase('user'); ?></div>
                                <select  class="form-control col-md-12 col-xs-12"  name="user_id"  id="user_id" >
                                    <option value="">--<?php echo get_phrase('select'); ?>--</option>                                                                                         
                                </select>
                                <div class="help-block"><?php echo form_error('user_id'); ?></div>
                            </div>
                        </div>                    
                       
                    
                        <div class="col-md-2 col-sm-2 col-xs-12">
                            <div class="form-group"><br/>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('find'); ?></button>
                            </div>
                        </div>
                    </div>
                <?php echo form_close(); ?>
            </div>   
        </div>
    </div>          
</div>
<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?php echo get_phrase('sl_no'); ?></th>                                       
                            <th><?php echo get_phrase('photo'); ?></th>                                                                    
                            <th><?php echo get_phrase('name'); ?></th>
                            <th><?php echo get_phrase('phone'); ?></th>
                            <th><?php echo get_phrase('email'); ?></th>
                            <th><?php echo get_phrase('password'); ?></th>                                            
                            <th><?php echo get_phrase('action'); ?></th>                                            
                        </tr>
                    </thead>
                    <tbody id="fn_mark">   
                        <?php
                        $count = 1;
                        if (isset($users) && !empty($users)) {
                            ?>
                            <?php foreach ($users as $obj) { ?>
                                <?php
                                $path = '';
                                $type = '';
                                if($role_id == STUDENT){ $path = 'student'; $type = 'student'; }
                                elseif($role_id == INSTRUCTOR){ $path = 'teacher'; $type = 'teacher';  }
                                else{ $path = 'employee'; $type = 'employee';  }
                                ?>
                                <tr>
                                    <td><?php echo $count++;  ?></td>                                               
                                    <td>
                                        <?php if ($obj->photo != '') { ?>                                        
                                            <img src="<?php echo base_url(); ?>uploads/<?php echo $path; ?>-photo/<?php echo $obj->photo; ?>" alt="" width="50" /> 
                                        <?php } else { ?>
                                            <img src="<?php echo IMG_URL; ?>default-user.png" alt="" width="50" /> 
                                        <?php } ?>
                                    </td>
                                    <td><?php echo ucfirst($obj->name); ?></td>
                                    <td><?php echo $obj->phone; ?></td>
                                    <td><?php echo $obj->email; ?></td>   
                                    <td><?php echo base64_decode($obj->temp_password); ?></td>   
                                    <td>
                                        <?php if($path == 'employee') { $path = 'hrm/users';} ?>                                                 
                                        <a  onclick="get_user_modal(<?php echo $obj->id; ?>,'<?php echo $path; ?>', '<?php echo $type; ?>');"  data-toggle="modal" data-target=".bs-user-modal-lg"  class="btn btn-success btn-xs"><i class="fa fa-eye"></i> <?php echo get_phrase('view'); ?> </a><br/>
                                    </td>   
                                </tr>
                            <?php } ?>
                        <?php } ?> 

                    </tbody>
                </table>  
            </div>
        </div>
    </div>
</div>



<div class="modal fade bs-user-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><?php echo get_phrase('user'); ?> <?php echo get_phrase('information'); ?></h4>
            </div>
            <div class="modal-body fn_user_data"></div>       
        </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_user_modal(user_id, path, type){   
         
        $('.fn_user_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
            type   : "POST",
            url    : './../../'+path+"/get_single_"+type,
            data   : { employee_id: user_id, student_id: user_id, teacher_id: user_id, guardian_id: user_id },  
            success: function(response){                                                   
                if(response)
                {
                    $('.fn_user_data').html(response);
                }
            }
        });
    }
</script>
<!-- Student modal -->
<div class="modal fade bs-student-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><?php echo get_phrase('student'); ?> <?php echo get_phrase('information'); ?></h4>
            </div>
            <div class="modal-body fn_student_data"></div>       
        </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_student_modal(student_id){
         
        $('.fn_student_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('student/get_single_student'); ?>",
            data   : {student_id : student_id},  
            success: function(response){                                                   
                if(response)
                {
                    $('.fn_student_data').html(response);
                }
            }
        });
    }
</script>
<!-- Student modal end -->
<script type="text/javascript">     
    $('#school_id').on('change', function(){
        $('#role_id').prop('selectedIndex',0);
        $('#user_id').prop('selectedIndex',0);
    });
     
     
    <?php if(isset($role_id)){ ?>
        get_user_by_role('<?php echo $role_id;  ?>', '<?php echo $user_id; ?>');
    <?php } ?>
        
    function get_user_by_role(role_id, user_id){          
        get_user(role_id,user_id);
    }
   
   function get_user(role_id, user_id){
       
       if(role_id == ''){
           role_id = $('#role_id').val();
       }
       
       $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : {role_id : role_id , user_id:user_id},               
            async  : false,
            success: function(response){                                                   
                if(response)
                {
                   $('#user_id').html(response); 
                }
            }
        }); 
    }
   

    $(document).ready(function() {
        $('#datatable-responsive').DataTable( {
            iDisplayLength: 15,
            search: true,              
            responsive: true
        });
    });
        
    $("#user").validate();    
</script> 

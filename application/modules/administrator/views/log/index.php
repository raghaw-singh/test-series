<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('activity_log');?></h3>
                <div class="box-tools pull-right">
                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body"> 
                <?php echo form_open_multipart(site_url('administrator/activitylog'), array('name' => 'activitylog', 'id' => 'activitylog', 'class' => ''), ''); ?>
                    <div class="row">
                      
                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="item form-group"> 
                                <div><?php echo get_phrase('user'); ?> <?php echo get_phrase('type'); ?> </div>
                                <select  class="form-control col-md-7 col-xs-12"  name="role_id"  id="role_id" onchange="get_user_by_role(this.value, '', '');">
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
                       
                    
                        <div class="col-md-3 col-sm-3 col-xs-12">
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
                <?php echo form_open_multipart(site_url('administrator/activitylog/multidelete'), array('name' => 'delete', 'id' => 'delete', 'class' => 'form-horizontal form-label-left'), ''); ?>
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><?php echo get_phrase('sl_no'); ?></th>
                                <th><?php echo get_phrase('check_all'); ?></th>
                                <th><?php echo get_phrase('name'); ?></th>
                                <th><?php echo get_phrase('phone'); ?></th>
                                <th><?php echo get_phrase('email'); ?></th>
                                <th><?php echo get_phrase('activity_log'); ?></th> 
                                <th><?php echo get_phrase('action'); ?> </th>                                            
                            </tr>
                        </thead>
                        <tbody>   
                            <?php
                            $count = 1;
                            if (isset($activity_logs) && !empty($activity_logs)) {
                                ?>
                                <?php foreach ($activity_logs as $obj) { ?>
                                    
                                    <tr>
                                        <td><?php echo $count++;  ?></td>     
                                        <td>
                                            <input class="log_check" type="checkbox" name="log[<?php echo $obj->id; ?>]" value="<?php echo $obj->id; ?>" />
                                        </td> 
                                        <td><?php echo ucfirst($obj->name); ?></td>
                                        <td><?php echo $obj->phone; ?></td>
                                        <td><?php echo $obj->email; ?></td>   
                                        <td><?php echo $obj->activity; ?> at <?php echo date($this->gsms_setting->sms_date_format.' H:i:s a', strtotime($obj->created_at)); ?></td>   
                                        <td>                                                 
                                            <?php if(has_permission(DELETE, 'administrator', 'activitylog')){ ?>    
                                                <a href="<?php echo site_url('administrator/activitylog/delete/'.$obj->id); ?>"  onclick="javascript: return confirm('<?php echo get_phrase('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo get_phrase('delete'); ?> </a>
                                            <?php } ?> 
                                        </td>   
                                    </tr>
                                <?php } ?>
                            <?php } ?> 

                        </tbody>
                    </table>
                    <?php if(has_permission(DELETE, 'administrator', 'activitylog')){ ?> 
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="form-group">
                                <a class="btn btn-success"  href="javascript:void(0);" onclick="check_all();"><?php echo get_phrase('check_all'); ?></a>
                                <a class="btn btn-success"  href="javascript:void(0);" onclick="uncheck_all();"><?php echo get_phrase('uncheck_all'); ?></a>
                                <button id="send" type="submit" class="btn btn-success" ><?php echo get_phrase('delete'); ?> <?php echo get_phrase('all'); ?></button>
                            </div>
                        </div>
                    <?php } ?>
                <?php echo form_close(); ?> 
            </div>
        </div>
    </div>
</div>

 <script type="text/javascript">
    <?php if(isset($role_id)){ ?>
        get_user_by_role('<?php echo $role_id;  ?>', '<?php echo $user_id; ?>');
    <?php } ?>
    function get_user_by_role(role_id, user_id){       
        get_user(role_id, user_id);        
    }
   
    function get_user(role_id, user_id){
       
        if(role_id == ''){
           role_id = $('#role_id').val();
        }
       
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_user_by_role'); ?>",
            data   : { role_id : role_id ,user_id:user_id},               
            async  : false,
            success: function(response){                                                   
                if(response)
                {
                   $('#user_id').html(response); 
                }
            }
        }); 
    }
   
    $('.fn_update_status').click(function(){   
        var user_id = $(this).attr('id');    
        var status = $(this).attr('itemid');    
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/update_user_status'); ?>",
            data   : { user_id:user_id,  status : status },               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   toastr.success('Success'); 
                   location.reload();
               }
            }
        }); 
    });
    
    $(document).ready(function() {
        $('#datatable-responsive').DataTable( {
            iDisplayLength: 15,
            search: true
        });
    });
        
    $("#activitylog").validate(); 
    function check_all(){         
        $('.log_check').prop('checked', true);
    }
    function uncheck_all(){
        $('.log_check').prop('checked', false);;
    }
</script> 

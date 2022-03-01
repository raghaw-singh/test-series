<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('role_permission');?></h3>
            </div>
            <ul class="nav nav-tabs">                
                <li  class="active"><a href="#tab_perimission" role="tab" data-toggle="tab" aria-expanded="false"><i class="fa fa-gear"></i> <?php echo get_phrase('role_permission'); ?></a></li>                          
            </ul>
            <div class="tab-content">
                <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_role_list" >
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><?php echo get_phrase('sl_no'); ?></th>
                                <th><?php echo get_phrase('role'); ?> <?php echo get_phrase('name'); ?></th>
                                <th><?php echo get_phrase('note'); ?></th>
                                <th><?php echo get_phrase('is_default'); ?></th>
                                <th><?php echo get_phrase('action'); ?></th>                                            
                            </tr>
                        </thead>
                        <tbody>   
                            <?php $count = 1; if(isset($roles) && !empty($roles)){ ?>
                                <?php foreach($roles as $obj){ ?>
                                <tr>
                                    <td><?php echo $count++; ?></td>
                                    <td><?php echo ucfirst($obj->name); ?></td>
                                    <td><?php echo $obj->note; ?></td>
                                    <td><?php echo $obj->is_default ? get_phrase('yes') : get_phrase('no'); ?></td>
                                    <td>
                                        <?php if(has_permission(EDIT, 'administrator', 'permission')){ ?>  
                                            <a href="<?php echo site_url('administrator/permission/index/'.$obj->id); ?>" class="btn btn-success btn-xs"><i class="fa fa-folder-open-o"></i> <?php echo get_phrase('role_permission'); ?> <?php echo get_phrase('setting'); ?> </a>
                                        <?php } ?>
                                    </td>
                                </tr>
                                <?php } ?>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

                <?php if(isset($permission)){ ?>
                <div class="tab-pane pade active" id="tab_perimission"> 
                    
                    <div class="x_content">
                        <div class="col-md-12">
                            <?php echo get_phrase('role_permission'); ?> : <?php echo $role->name; ?>
                        </div>
                    </div>
                    <?php echo form_open(site_url('administrator/permission/index/'.$role_id), array('name' => 'login', 'id' => 'login', 'class'=>'form-horizontal form-label-left'), ''); ?>
                    
                        <table class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th><?php echo get_phrase('sl_no'); ?></th>           
                                    <th  class="role-text" width="10%"><?php echo get_phrase('module'); ?> <?php echo get_phrase('name'); ?></th>
                                    <th  class="role-text"><?php echo get_phrase('function'); ?> <?php echo get_phrase('name'); ?></th>
                                    <th><?php echo get_phrase('view'); ?> &nbsp; <input type="checkbox" id="fn_view" class="role-check" value="1" /> </th>                  
                                    <th><?php echo get_phrase('add'); ?>  &nbsp;<input type="checkbox" id="fn_add"  class="role-check" value="1" /></th>                  
                                    <th><?php echo get_phrase('edit'); ?>  &nbsp;<input type="checkbox" id="fn_edit" class="role-check" value="1" /></th> 
                                    <th><?php echo get_phrase('delete'); ?>  &nbsp; <input type="checkbox" id="fn_delete" class="role-check" value="1" /></th> 
                                    <th><?php echo get_phrase('status'); ?>  &nbsp; <input type="checkbox" id="fn_status" class="role-check" value="1" /></th> 
                                    <th><?php echo get_phrase('export'); ?>  &nbsp; <input type="checkbox" id="fn_export" class="role-check" value="1" /></th> 
                                 </tr>
                            </thead>
                            <tbody>
                                 <?php if(isset($modules) && !empty($modules)){ ?>
                                 <?php $module = 1; foreach( $modules AS $obj ){ ?> 
                                    
                                     <tr>           
                                        <td class="role-text" style="background: #ececec; font-weight: bold;"><?php echo $module; ?></td>
                                        <td colspan="8" class="role-text" style="background: #ececec; font-weight: bold;"><?php echo $obj->module_name; ?> &raquo;</td>                          
                                     </tr>
                                    <?php $operations = get_operation_by_module($obj->id); ?> 
                                    <?php if(isset($operations) && !empty($operations)){ ?>
                                        <?php $operaton = 1; foreach( $operations AS $op ){ ?>
                                        <?php $permission = get_permission_by_operation($role_id, $op->id); ?>
                                        <tr>           
                                            <td class="role-text"><?php echo $module; ?>.<?php echo $operaton++; ?></td>                     
                                            <td colspan="2" class="role-text" style="padding-left: 120px;">
                                               <?php echo $op->operation_name; ?>
                                               <input type="hidden" name="operation[<?php echo $op->id; ?>]" id="operatio[]" value="<?php echo $op->id; ?>" />
                                            </td>    
                                            <td>
                                                <?php if($op->is_view_vissible){ ?>
                                                <input type="checkbox" class="fn_view" name="is_view[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_view) && $permission->is_view == 1){ echo 'checked="checked"'; } ?> />
                                                <?php } ?>
                                            </td>
                                                
                                            <td>
                                                <?php if($op->is_add_vissible){ ?>
                                                <input type="checkbox" class="fn_add"  name="is_add[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_add) && $permission->is_add == 1){ echo 'checked="checked"'; } ?> />
                                                <?php } ?>
                                            </td>
                                            <td>
                                            <?php if($op->is_edit_vissible){ ?>
                                                <input type="checkbox" class="fn_edit" name="is_edit[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_edit) && $permission->is_edit == 1){ echo 'checked="checked"'; } ?> />
                                            <?php } ?>
                                            </td>
                                            <td>
                                                <?php if($op->is_delete_vissible){ ?>
                                                    <input type="checkbox" class="fn_delete"  name="is_delete[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_delete) && $permission->is_delete == 1){ echo 'checked="checked"'; } ?> />
                                                <?php } ?>
                                            </td>  
                                            <td>
                                                <?php if($op->is_status_vissible){ ?>
                                                    <input type="checkbox" class="fn_status"  name="is_status[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_status) && $permission->is_status == 1){ echo 'checked="checked"'; } ?> />
                                                <?php } ?>
                                            </td>   
                                            <td>
                                                <?php if($op->is_export_vissible){ ?>
                                                    <input type="checkbox" class="fn_export"  name="is_export[<?php echo $op->id; ?>]" value="1" <?php if(isset($permission->is_export) && $permission->is_export == 1){ echo 'checked="checked"'; } ?> />
                                                <?php } ?>
                                            </td>                     
                                        </tr>                                            
                                     
                                        <?php } ?>
                                    <?php } ?>  
                                
                                <?php $module++; } ?>
                                <?php }else{ ?>
                                <tr><td colspan="9" class="not-found"><?php echo get_phrase('no_data_found'); ?></td></tr>
                                <?php } ?>
                            </tbody>
                            
                        </table>
                    
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <input type="hidden" name="role_id" id="role_id" value="<?php echo $role_id;; ?>" />
                                <a  href="<?php echo site_url('administrator/role'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                
                                <?php if(has_permission(EDIT, 'administrator', 'permission')){ ?>                                                                                  
                                      <button  type="submit" class="btn btn-success"><?php echo get_phrase('update'); ?> <?php echo get_phrase('role_permission'); ?></button>
                                <?php } ?>
                            </div>
                        </div>                                    
                   <?php echo form_close(); ?> 
                </div>   
               <?php } ?>

            </div> 
        </div>
    </div>
</div>
<!-- datatable with buttons -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#datatable-responsive').DataTable( {
            iDisplayLength: 15,
            search: true
        });
        $("#fn_view").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_view").prop("checked", true);
            } else {
                $(".fn_view").prop("checked", false);
            }
        });
        $("#fn_add").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_add").prop("checked", true);
            } else {
                $(".fn_add").prop("checked", false);
            }
        });
        $("#fn_edit").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_edit").prop("checked", true);
            } else {
                $(".fn_edit").prop("checked", false);
            }
        });
        $("#fn_delete").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_delete").prop("checked", true);
            } else {
                $(".fn_delete").prop("checked", false);
            }
        });

        $("#fn_status").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_status").prop("checked", true);
            } else {
                $(".fn_status").prop("checked", false);
            }
        });

        $("#fn_export").click(function () {
            if ($(this).is(":checked")) {
                $(".fn_export").prop("checked", true);
            } else {
                $(".fn_export").prop("checked", false);
            }
        });

    });
</script>
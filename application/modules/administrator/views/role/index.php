<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('user_role');?></h3>
            </div>
            <ul class="nav nav-tabs"> 
                <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_role_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo get_phrase('role'); ?> <?php echo get_phrase('list'); ?></a> </li>
                <!-- <?php if(has_permission(ADD, 'administrator', 'role')){ ?>
                    <li  class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_add_role"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo get_phrase('add'); ?> <?php echo get_phrase('role'); ?></a> </li>                          
                <?php } ?>   -->
                <?php if(isset($edit)){ ?>
                    <li  class="active"><a href="#tab_edit_role"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('edit'); ?> <?php echo get_phrase('role'); ?></a> </li>                          
                <?php } ?>   
                
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
                                        <?php if(has_permission(EDIT, 'administrator', 'role')){ ?>
                                            <a href="<?php echo site_url('administrator/role/edit/'.$obj->id); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('edit'); ?> </a>
                                        <?php } ?>
                                        <?php if(has_permission(DELETE, 'administrator', 'role')){ ?>
                                            <?php if(!$obj->is_default){ ?>
                                                <a href="<?php echo site_url('administrator/role/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php echo get_phrase('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo get_phrase('delete'); ?> </a>
                                            <?php } ?>
                                        <?php } ?>
                                    </td>
                                </tr>
                                <?php } ?>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

                <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_add_role">
                    <?php echo form_open(site_url('administrator/role/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo get_phrase('role'); ?> <?php echo get_phrase('name'); ?> <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="name"  id="name" value="<?php echo isset($name) ?  $name : ''; ?>" placeholder="<?php echo get_phrase('role'); ?> <?php echo get_phrase('name'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('name'); ?></div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="note"><?php echo get_phrase('note'); ?></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea  class="form-control col-md-7 col-xs-12"  name="note"  id="note" placeholder="<?php echo get_phrase('note'); ?>"><?php echo isset($note) ?  $note : ''; ?></textarea>
                                <div class="help-block"><?php echo form_error('note'); ?></div>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('administrator/role'); ?>" type="submit" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>  

                <?php if(isset($edit)){ ?>
                <div class="tab-pane fade in active" id="tab_edit_role">
                    <?php echo form_open(site_url('administrator/role/edit'), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo get_phrase('role'); ?> <?php echo get_phrase('name'); ?> <span class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="hidden" value="<?php echo isset($role) ? $role->id : ''; ?>" name="id" />
                                <input  class="form-control col-md-7 col-xs-12"  name="name" value="<?php echo isset($role) ? $role->name : ''; ?>"  placeholder="<?php echo get_phrase('role'); ?> <?php echo get_phrase('name'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('name'); ?></div>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="note"><?php echo get_phrase('note'); ?></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea  class="form-control col-md-7 col-xs-12"  name="note"  id="note" placeholder="<?php echo get_phrase('note'); ?>"><?php echo isset($role) ? $role->note : ''; ?></textarea>
                                <div class="help-block"><?php echo form_error('note'); ?></div>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('administrator/role'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('update'); ?></button>
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
    });
    $("#add").validate();  
    $("#edit").validate();     
</script>
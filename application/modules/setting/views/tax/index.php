<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage_tax');?></h3>
            </div>
            <ul class="nav nav-tabs"> 
                <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_tax_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo get_phrase('tax'); ?> <?php echo get_phrase('list'); ?></a> </li>
                <?php if(has_permission(ADD, 'setting', 'tax')){ ?>
                    <li  class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_add_tax"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo get_phrase('add'); ?> <?php echo get_phrase('tax'); ?></a> </li>                          
                <?php } ?>     
                <?php if(isset($edit)){ ?>
                    <li  class="active"><a href="#tab_edit_tax"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('edit'); ?> <?php echo get_phrase('tax'); ?></a> </li>                          
                <?php } ?>                
                
            </ul>   
            <div class="tab-content">
                <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_tax_list" >
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><?php echo get_phrase('sl_no'); ?></th>
                                <th><?php echo get_phrase('tax'); ?></th>
                                <th><?php echo get_phrase('percentage'); ?></th>
                                <th><?php echo get_phrase('action'); ?></th>                                            
                            </tr>
                        </thead>
                        <tbody>   
                            <?php $count = 1; if(isset($taxs) && !empty($taxs)){ ?>
                                <?php foreach($taxs as $obj){ ?>
                                <tr>
                                    <td><?php echo $count++; ?></td>
                                    <td><?= $obj->name;?></td>
                                    <td><?= $obj->percentage;?></td>
                                    <td>
                                        <?php if(has_permission(EDIT, 'setting', 'tax')){ ?>
                                            <a href="<?php echo site_url('setting/tax/edit/'.$obj->id); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('edit'); ?> </a>
                                        <?php } ?>
                                        <?php if(has_permission(DELETE, 'setting', 'tax')){ ?>
                                            <a href="<?php echo site_url('setting/tax/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php get_phrase('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo get_phrase('delete'); ?> </a>
                                            
                                        <?php } ?> 
                                    </td>
                                </tr>
                                <?php } ?>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

                <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_add_tax">
                    <?php echo form_open(site_url('setting/tax/saveTax'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        
                        
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo get_phrase('name'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text"  class="form-control col-md-7 col-xs-12"  name="name" value="<?php echo isset($name) ? $name : ''; ?>"  placeholder="<?php echo get_phrase('name'); ?>" required="required" autocomplete="off"/>
                                <div class="help-block"><?php echo form_error('name'); ?></div>
                            </div>
                        </div>
                                                      
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="percentage"><?php echo get_phrase('percentage'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text"  class="form-control col-md-7 col-xs-12"  name="percentage"  value="<?php echo isset($percentage) ? $percentage : ''; ?>"  placeholder="<?php echo get_phrase('percentage'); ?>" required="required" autocomplete="off"/>
                                <div class="help-block"><?php echo form_error('percentage'); ?></div>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('setting/tax'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>  

                <?php if(isset($edit)){ ?>
                <div class="tab-pane fade in active" id="tab_edit_tax">
                    <?php echo form_open(site_url('setting/tax/saveTax/'.$tax->id), array('name' => 'edit', 'id' => 'edit', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name"><?php echo get_phrase('name'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text"  class="form-control col-md-7 col-xs-12"  name="name"  value="<?= $tax->name; ?>"  placeholder="<?php echo get_phrase('name'); ?>" required="required" autocomplete="off"/>
                                <div class="help-block"><?php echo form_error('name'); ?></div>
                            </div>
                        </div>
                                                      
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="session_end"><?php echo get_phrase('percentage'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text"  class="form-control col-md-7 col-xs-12"  name="percentage"  value="<?= $tax->percentage;?>"  placeholder="<?php echo get_phrase('percentage'); ?>" required="required" autocomplete="off"/>
                                <div class="help-block"><?php echo form_error('percentage'); ?></div>
                            </div>
                        </div>
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <input type="hidden" value="<?= $tax->id;?>" name="id" />
                                <a href="<?php echo site_url('setting/tax'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
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
    $("#add").validate();  
    $("#edit").validate();
    $(document).ready(function () {
        $("#datatable-responsive").DataTable({
            iDisplayLength: 15,
            search: true,
        });
    });
  
</script>
<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage_email_template');?></h3>
            </div>
            <ul class="nav nav-tabs"> 
                <li class="<?php if(isset($list)){ echo 'active'; }?>"><a href="#tab_template_list"   role="tab" data-toggle="tab" aria-expanded="true"><i class="fa fa-list-ol"></i> <?php echo get_phrase('template'); ?> <?php echo get_phrase('list'); ?></a> </li>

                <?php if(has_permission(ADD, 'administrator', 'emailtemplate')){ ?>
                    <li  class="<?php if(isset($add)){ echo 'active'; }?>"><a href="#tab_add_template"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-plus-square-o"></i> <?php echo get_phrase('add'); ?> <?php echo get_phrase('template'); ?></a> </li>                          
                <?php } ?>     
                
                <?php if(isset($edit)){ ?>
                    <li  class="active"><a href="#tab_edit_template"  role="tab"  data-toggle="tab" aria-expanded="false"><i class="fa fa-pencil-square-o"></i> <?php echo get_phrase('edit'); ?> <?php echo get_phrase('template'); ?></a> </li>                          
                <?php } ?>  
            </ul>   
            <div class="tab-content">
                
                <div  class="tab-pane fade in <?php if(isset($list)){ echo 'active'; }?>" id="tab_template_list" >
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th><?php echo get_phrase('sl_no'); ?></th>
                                <th><?php echo get_phrase('receiver_type'); ?></th>
                                <th><?php echo get_phrase('template'); ?> <?php echo get_phrase('title'); ?></th>
                                <th><?php echo get_phrase('template'); ?></th>
                                <th><?php echo get_phrase('action'); ?></th>                                            
                            </tr>
                        </thead>
                        <tbody>   
                            <?php $count = 1; if(isset($templates) && !empty($templates)){ ?>
                                <?php foreach($templates as $obj){ ?>                                       
                                <tr>
                                    <td><?php echo $count++; ?></td>
                                    <td><?php echo $obj->receiver_type; ?></td>
                                    <td><?php echo $obj->title; ?></td>                                           
                                    <td><?php echo $obj->template; ?></td>                                           
                                    <td>
                                        <?php if(has_permission(EDIT, 'administrator', 'emailtemplate')){ ?>
                                            <a href="<?php echo site_url('administrator/emailtemplate/edit/'.$obj->id); ?>" class="btn btn-success btn-xs"><i class="fa fa-edit"></i> <?php echo get_phrase('edit'); ?> </a>
                                        <?php } ?>
                                        <?php if(has_permission(DELETE, 'administrator', 'emailtemplate')){ ?>
                                            <a href="<?php echo site_url('administrator/emailtemplate/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?php echo get_phrase('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?php echo get_phrase('delete'); ?> </a>
                                        <?php } ?>
                                    </td>
                                </tr>
                                <?php } ?>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>

                <div  class="tab-pane fade in <?php if(isset($add)){ echo 'active'; }?>" id="tab_add_template">
                    <?php echo form_open_multipart(site_url('administrator/emailtemplate/add'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        
                        <div class="item form-group"> 
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo get_phrase('receiver_type'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_tag_by_role(this.value, 'add');">
                                    <option value="">--<?php echo get_phrase('select'); ?> --</option> 
                                    <?php foreach($roles as $obj ){ ?>
                                    <option value="<?php echo $obj->id; ?>" ><?php echo $obj->name; ?></option>
                                    <?php } ?>                                            
                                </select>
                                <div class="help-block"><?php echo form_error('role_id'); ?></div>
                            </div>
                        </div>                                
                                                            
                        <div class="item form-group">
                            <label class="control-label col-md-3" for="type"><?= get_phrase('type');?> <span class="text-danger">*</span></label>
                            <div class="col-md-4">
                                <select class="form-control" name="type" id="type">
                                    <option value=""><?= get_phrase('select');?></option>
                                    <?php $template_types   =   template_types();?>
                                    <?php if(!empty($template_types)){foreach($template_types as $types){?>
                                    <option value="<?= $types;?>"><?= ucwords($types);?></option>
                                    <?php } }?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title"><?php echo get_phrase('template'); ?> <?php echo get_phrase('title'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="title"  id="title" value="" placeholder="<?php echo get_phrase('template'); ?> <?php echo get_phrase('title'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('title'); ?></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="template"><?php echo get_phrase('template'); ?> <span class="required">*</span></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <textarea  class="form-control summernote" name="template" id="add_template" rows="10" required="required" placeholder="<?php echo get_phrase('template'); ?>"> </textarea>
                                <div class="help-block"><?php echo form_error('template'); ?></div>
                            </div>
                        </div>                      
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo get_phrase('dynamic_tag'); ?></label>
                            <div class="col-md-6 col-sm-6 col-xs-12"  id="fn_add_tag"></div>
                        </div>   
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <a href="<?php echo site_url('administrator/emailtemplate/index'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>  
                
                <div  class="tab-pane fade in <?php if(isset($edit)){ echo 'active'; }?>" id="tab_edit_template">
                    <?php echo form_open_multipart(site_url('administrator/emailtemplate/edit'), array('name' => 'add', 'id' => 'add', 'class'=>'form-horizontal form-label-left'), ''); ?>
                        
                        <div class="item form-group"> 
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="role_id"><?php echo get_phrase('receiver_type'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <select  class="form-control col-md-12 col-xs-12"  name="role_id"  id="role_id" required="required" onchange="get_tag_by_role(this.value, 'edit');">
                                    <option value="">--<?php echo get_phrase('select'); ?> --</option> 
                                    <?php foreach($roles as $obj ){ ?>
                                    <option value="<?php echo $obj->id; ?>" <?php if(isset($template) && $template->role_id == $obj->id ){ echo 'selected="selected"';} ?> ><?php echo $obj->name; ?></option>
                                    <?php } ?>                                            
                                </select>
                                <div class="help-block"><?php echo form_error('role_id'); ?></div>
                            </div>
                        </div>                                
                                                            
                        <div class="item form-group">
                            <label class="control-label col-md-3" for="type"><?= get_phrase('type');?> <span class="text-danger">*</span></label>
                            <div class="col-md-4">
                                <select class="form-control" name="type" id="type">
                                    <option value=""><?= get_phrase('select');?></option>
                                    <?php $template_types   =   template_types();?>
                                    <?php if(!empty($template_types)){foreach($template_types as $types){?>
                                    <option value="<?= $types;?>" <?php if(isset($template) && $template->types == $types ){ echo 'selected="selected"';} ?>><?= ucwords($types);?></option>
                                    <?php } }?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group"> 
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="title"><?php echo get_phrase('template'); ?> <?php echo get_phrase('title'); ?> <span class="required">*</span></label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input  class="form-control col-md-7 col-xs-12"  name="title"  id="title" value="<?php if(isset($template)){ echo $template->title;} ?>" placeholder="<?php echo get_phrase('template'); ?> <?php echo get_phrase('title'); ?>" required="required" type="text">
                                <div class="help-block"><?php echo form_error('title'); ?></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="template"><?php echo get_phrase('template'); ?> <span class="required">*</span></label>
                            <div class="col-md-9 col-sm-9 col-xs-12">
                                <textarea  class="form-control summernote" name="template" id="edit_template" required="required" placeholder="<?php echo get_phrase('template'); ?>" rows="10"><?php if(isset($template)){ echo $template->template;} ?> </textarea>
                                <div class="help-block"><?php echo form_error('template'); ?></div>
                            </div>
                        </div>                      
                        <div class="form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12"><?php echo get_phrase('dynamic_tag'); ?></label>
                            <div class="col-md-6 col-sm-6 col-xs-12"  id="fn_edit_tag"></div>
                        </div>   
                        <div class="ln_solid"></div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <input type="hidden" id="id" name="id" value="<?php if(isset($template)){ echo $template->id;} ?>"/>
                                <a href="<?php echo site_url('administrator/emailtemplate/index'); ?>" class="btn btn-primary"><?php echo get_phrase('cancel'); ?></a>
                                <button id="send" type="submit" class="btn btn-success"><?php echo get_phrase('submit'); ?></button>
                            </div>
                        </div>
                    <?php echo form_close(); ?>
                </div>  
            </div>
        </div>
    </div>
</div>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<script type="text/javascript">
    <?php if(isset($template) && !empty($template) ) { ?>
        get_tag_by_role('<?php echo $template->role_id ?>', 'edit');
    <?php } ?>
   
    function get_tag_by_role(role_id, type){
        $.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_tag_by_role'); ?>",
            data   : { role_id : role_id},               
            async  : false,
            success: function(response){                                                   
               if(response)
               {
                   $('#fn_'+type+'_tag').html(response); 
               }
            }
        }); 
    }
   
    $(document).ready(function() {
        $('#datatable-responsive').DataTable( {
            iDisplayLength: 15,
            search: true
        });
    });
    $("#add").validate();   
    $("#edit").validate();  
    $("textarea.summernote").summernote({
        placeholder: "",
        tabsize: 2,
        height: 250,
        toolbar: [
            ["style", ["style"]],
            ["font", ["bold", "italic", "underline", "clear"]],
            // ['font', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
            //['fontname', ['fontname']],
            // ['fontsize', ['fontsize']],
            ["color", ["color"]],
            ["para", ["ul", "ol", "paragraph"]],
            ["height", ["height"]],
            ["table", ["table"]],
            ["insert", ["link", "picture", "hr"]],
            //['view', ['fullscreen', 'codeview']],
            ["help", ["help"]],
        ],
    });
 
</script> 

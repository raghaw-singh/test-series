<div class="row">
    <div class="col-md-12">
        <div class="nav-tabs-custom">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('users');?></h3>
                <div class="box-tools pull-right">
                    <?php if(has_permission(ADD,'hrm','users')){?>
                    <a href="<?= base_url('hrm/users/add')?>" class="btn btn-primary btn-sm btn-info"><i class="fa fa-plus-square-o"></i> <?= get_phrase('add').' '.get_phrase('users');?></a>
                    <?php } ?>
                </div>
            </div>  
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sl_no'); ?></th>
                            <th><?= get_phrase('photo'); ?></th>
                            <th><?= get_phrase('name'); ?></th>
                            <th><?= get_phrase('phone'); ?></th>
                            <th><?= get_phrase('email'); ?></th>
                            <th><?= get_phrase('action'); ?></th>                                            
                        </tr>
                    </thead>
                    <tbody>  
                        <?php $role_id = logged_in_role_id(); ?>
                        <?php  $count = 1; if(isset($employees) && !empty($employees)){ ?>
                            <?php foreach($employees as $obj){ ?>
                            <?php if($obj->role_id == SUPER_ADMIN && $role_id != $obj->role_id){ continue;} ?>
                            <tr>
                                <td><?= $count++; ?></td>
                                <td>
                                    <?php  if($obj->photo != ''){ ?>
                                        <?php if($obj->role_id==3){?>
                                        <img src="<?= base_url('uploads/teacher-photo/'.$obj->photo)?>" width="120">
                                        <?php } elseif($obj->role_id==4){?>
                                        <img src="<?= base_url('uploads/student-photo/'.$obj->photo)?>" width="120">
                                        <?php }else {?>
                                        <img src="<?= base_url('uploads/employee-photo/'.$obj->photo)?>" width="120">
                                        <?php } ?>
                                    <?php }else{ ?>
                                        <img src="<?= IMG_URL; ?>/default-user.png" alt="" width="70" /> 
                                    <?php } ?>
                                </td>
                                <td>
                                    <?php if($obj->name){?>
                                    <b><?= ucfirst($obj->name).'<br>'; ?></b>
                                    <?php }?>
                                    <?php 
                                    $roles =  $this->user_model->get_single('roles',array('id'=>$obj->role_id));
                                    echo $roles->name;
                                    ?>
                                </td>
                                <td><?= $obj->phone; ?></td>
                                <td><?= $obj->email; ?></td>
                                <td>
                                    <?php if(has_permission(VIEW, 'hrm', 'users')){ ?>
                                        <a  onclick="get_employee_modal(<?= $obj->id; ?>);"  data-toggle="modal" data-target=".bs-employee-modal-lg"  class="btn btn-success btn-xs"><i class="fa fa-eye"></i> <?= get_phrase('view'); ?> </a>
                                    <?php } ?>                                                    
                                    
                                    <?php if(has_permission(EDIT, 'hrm', 'users')){ ?> 
                                        <a href="<?= site_url('hrm/users/edit/'.$obj->id); ?>" class="btn btn-info btn-xs"><i class="fa fa-pencil-square-o"></i> <?= get_phrase('edit'); ?> </a>
                                    <?php } ?>                                                 
                                            
                                    <?php if(has_permission(DELETE, 'hrm', 'users')){ ?> 
                                        <?php if($obj->id != 1){ ?> 
                                            <a href="<?= site_url('hrm/users/delete/'.$obj->id); ?>" onclick="javascript: return confirm('<?= get_phrase('confirm_alert'); ?>');" class="btn btn-danger btn-xs"><i class="fa fa-trash-o"></i> <?= get_phrase('delete'); ?> </a>
                                        <?php } ?>
                                    <?php } ?>
                                   
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
<style type="text/css">
#datatable-responsive img {
    width: 36px;
    border-radius: 50px;
}
</style>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>dist/css/dropify.min.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>dist/js/dropify.min.js"></script>
<div class="modal fade bs-employee-modal-lg" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title"><?= get_phrase('employee'); ?> <?= get_phrase('information'); ?></h4>
            </div>
            <div class="modal-body fn_employee_data">
            
            </div>       
        </div>
    </div>
</div>
<script type="text/javascript">
         
    function get_employee_modal(employee_id){ 
        $('.fn_employee_data').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?= IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
            type   : "POST",
            url    : "<?= site_url('hrm/users/get_single_employee'); ?>",
            data   : {employee_id : employee_id},  
            success: function(response){                                                   
                if(response)
                {
                    $('.fn_employee_data').html(response);
                }
            }
        });  
    }
</script>

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
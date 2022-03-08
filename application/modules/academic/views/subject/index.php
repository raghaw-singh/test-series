<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('subject');?></h3>
                <?php if(has_permission(VIEW,'hrm','users')){?>
                <div class="pull-right">
                    <a href="<?= base_url('academic/subject/add');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('subject');?></a>
                </div>
                <?php }?>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('subject_name') ?></th>
                            <th><?= get_phrase('subject_code') ?></th>
                            <th><?= get_phrase('pass_mark') ?></th>
                            <th><?= get_phrase('final_mark') ?></th>
                            <?php if(has_permission(VIEW,'hrm','users')){?>
                            <th><?= get_phrase('action') ?></th>
                            <?php }?>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($subjectData as  $obj) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $obj->subject_name; ?></td>
                            <td><?= $obj->subject_code; ?></td>
                            <td><?= $obj->pass_mark; ?></td>
                            <td><?= $obj->final_mark; ?></td>
                            <?php if(has_permission(VIEW,'hrm','users')){?>
                            <td>
                                <a href="<?= base_url('academic/subject/edit/'.$obj->id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>

                                <a href="<?= base_url('academic/subject/delete/'.$obj->id) ;?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>
                            </td>
                            <?php }?>
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
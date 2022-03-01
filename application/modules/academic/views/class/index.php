<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('manage').' '.get_phrase('class');?></h3>
                <div class="pull-right">
                    <a href="<?= base_url('academic/student_class/add_class');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('class');?></a>
                </div>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('class') ?></th>
                            <th><?= get_phrase('teacher_name') ?></th>
                            <th><?= get_phrase('action') ?></th>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($classData as  $student_info) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $student_info->class; ?></td>
                            <td><?= $student_info->teacher_name; ?></td>
                            <td>
                                <a href="<?= base_url('academic/student_class/edit/'.$student_info->id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>

                                <a href="<?= base_url('academic/student_class/delete/'.$student_info->id) ;?>" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> Delete</a>
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
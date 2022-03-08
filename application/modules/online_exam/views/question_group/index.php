<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('question').' '.get_phrase('group');?></h3>
                <?php if(has_permission(VIEW,'teacher','teacher')){?>
                <div class="pull-right">
                    <a href="<?= base_url('online_exam/question_group/add');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('question_group');?></a>
                </div> 
                <?php }?>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('title') ?></th>
                            <?php if(has_permission(VIEW,'teacher','teacher')){?>
                            <th><?= get_phrase('action') ?></th>
                            <?php } ?>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($groupList as  $obj) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $obj->title; ?></td>
                            <td>
                                <?php if(has_permission(VIEW,'teacher','teacher')){?>
                                <a href="<?= base_url('online_exam/question_group/edit/'.$obj->id) ;?>" class="btn btn-warning btn-xs"><i class="fa fa-edit"></i> Edit</a>
                                <?php } ?>
                                <?php if(has_permission(VIEW,'hrm','users')){?>
                                <a href="<?= base_url('online_exam/question_group/delete/'.$obj->id) ;?>" data-toggle="tooltip" title="delete" class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> delete</a>
                                <?php }?>
                            </td>
                        </tr>
                    </tbody><?php $count ++ ;  }   ?> 
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $('#datatable-responsive').DataTable();
</script>
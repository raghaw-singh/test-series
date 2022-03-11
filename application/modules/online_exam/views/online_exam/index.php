<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title titlefix"><?= get_phrase('online').' '.get_phrase('exam');?></h3>
                <?php if(has_permission(VIEW,'teacher','teacher')){?>
                <div class="pull-right">
                    <a href="<?= base_url('online_exam/online_exam/add_online_exam');?>" class="btn btn-info"><?= get_phrase('add').' '.get_phrase('online_exam');?></a>
                </div>
                <?php }?>
            </div>
            <div class="box-body">
                <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th><?= get_phrase('sr_no') ?></th>
                            <th><?= get_phrase('exam_title') ?></th>
                            <th><?= get_phrase('duration') ?> <small>(<?= get_phrase('min');?>)</small></th>
                            <th><?= get_phrase('class') ?></th>
                            <th><?= get_phrase('published') ?></th>
                            <th><?= get_phrase('action') ?></th>
                        </tr>
                    </thead>
                    <?php $count=1; foreach ($exam_details as  $obj) {  ?>
                    <tbody>
                        <tr>
                            <td><?= $count ;?></td>
                            <td><?= $obj->exam_title; ?></td>
                            <td><?= $obj->duration;?></td>
                            <td><?= $this->db->get_where('class',array('id'=>$obj->class))->row()->class;?></td>
                            <td><?= $obj->published; ?></td>
                            <td>
                                <?php if(has_permission(VIEW,'online_exam','take_exam')){?>
                                <a href="<?= base_url('online_exam/take_exam/index/'.$obj->id) ;?>" class="btn btn-success btn-xs" data-toggle="tooltip" title="<?= get_phrase('take_exam');?>"><i class="fa fa-columns"></i></a>
                                <?php } ?>
                                <?php if(has_permission(VIEW,'online_exam','add_question')){?>
                                <a href="<?= base_url('online_exam/add_question/index/'.$obj->id) ;?>" class="btn btn-success btn-xs" data-toggle="tooltip" title="<?= get_phrase('add_question');?>"><i class="fa fa-plus"></i></a>
                                <?php } ?>
                                <?php if(has_permission(EDIT,'online_exam','online_exam')){?>
                                <a href="<?= base_url('online_exam/online_exam/edit_online_exam/'.$obj->id) ;?>" class="btn btn-warning btn-xs" data-toggle="tooltip" title="<?= get_phrase('edit')?>"><i class="fa fa-edit"></i></a>
                                <?php } ?>
                                <?php if(has_permission(DELETE,'online_exam','online_exam')){?>
                                <a href="<?= base_url('online_exam/online_exam/delete/'.$obj->id) ;?>" class="btn btn-danger btn-xs" data-toggle="tooltip" title="<?= get_phrase('delete')?>"><i class="fa fa-trash"></i> 
                                </a>
                                <?php } ?>
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
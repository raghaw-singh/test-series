<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-body">
            	<form method="GET" action="<?php echo base_url('reports/course/index');?>">
            		<div class="col-md-3">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="category"><?= get_phrase('category');?></label>
					        <select class="form-control select2" name="category_id" id="category_id" onchange="get_course_list(this.value,'','')">
					            <option value="all" <?php if(!empty($category_id)){?><?php if($category_id=='all') echo 'selected'?><?php } ?>>All</option>
					            <?php foreach($courseList as $list){?>
					            <option value="<?= $list->id;?>" <?php if(!empty($category_id)){?><?php if($category_id==$list->id) echo 'selected'?><?php } ?>><?= $list->name;?></option>
					            <?php } ?>
					        </select>
					    </div>
					</div>
					<!-- Course Status -->
					<div class="col-md-5">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="course_id"><?= get_phrase('course');?></label>
					        <select class="form-control select2" name="course_id" id="course_id">
					            <option value="all" <?php if(!empty($course_id)){?><?php if($course_id=='all') echo 'selected'?><?php } ?>>All</option>
					            
					        </select>
					    </div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="report_type"><?= get_phrase('report_type');?></label>
					        <select class="form-control select2" data-toggle="select2" name="report_type" id="report_type">
					            <?php 
					            $courseReportType 	=	courseReportType();
					            foreach($courseReportType as $key=>$value ){?>
					            <option value="<?= $key;?>" <?php if(!empty($report_type)){?><?php if($report_type==$key) echo 'selected'?><?php }?>><?= $value;?></option>
					        	<?php } ?>
					        </select>
					    </div>
					</div>
					<div class="col-md-2">
					    <label for=".." class="text-white hidden-sm hidden-xs">..</label><br>
					    <button type="submit" class="btn btn-primary" name="button">Filter</button>
					    <?php if(has_permission(EXPORT,'reports','course')){?>
					    <button type="submit" class="btn btn-success" name="button">Export as PDF</button>
						<?php } ?>
					</div>

            	</form>
            </div>
		</div>
	</div>
</div>
<?php if(!empty($userReport)){?>
<div class="row">
	<div class="col-md-12 mt-20">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title titlefix"><?= get_phrase('report_by_course');?></h3>
				<div class="box-tools addmeeting">
						
				</div>    
            </div>
            <div class="box-body">
            	<div class="table-responsive">
            		<table class="table table-striped" id="table-responsive">
            			<thead>
            				<tr>
            					<th><?= get_phrase('#');?></th>
            					<th><?= get_phrase('course_title');?></th>
            					<th><?= get_phrase('user');?></th>
            					<th><?= get_phrase('report_type');?></th>
            				</tr>
            			</thead>
            			<tbody>
            				<?php $count=1; foreach($userReport as $obj){?>
            				<tr>
            					<td><?= $count;?></td>
            					<td><?= $obj->course_title;?></td>
            					<td>
            						<p>
            							<strong><?= $obj->first_name.' '.$obj->last_name;?></strong><br><?= $obj->email;?>
            						</p>
            					</td>
            					<td>
            						<?php if($report_type=='progress'){?>

            						<div class="progress">
  										<div class="progress-bar bg-info" role="progressbar" style="width: <?= get_course_progress($obj->course_id,$obj->user_id); ?>%;" aria-valuenow="<?= get_course_progress($obj->course_id,$obj->user_id); ?>" aria-valuemin="0" aria-valuemax="100"><?= get_course_progress($obj->course_id,$obj->user_id); ?>%</div>
  									</div>
            						<?php } elseif($report_type=='scores'){?>
            						<?php 
            							$user_meta 			=	get_meta_data('users',$obj->user_id);
            							$watch_history_array = json_decode($user_meta->watch_history, true);
            							echo count($watch_history_array);
            						?>
            						<?php } ?>
            					</td>
            				</tr>
            				<?php $count++; } ?>
            			</tbody>
            		</table>
            	</div>
            </div>
        </div>
    </div>
</div>
<?php } else{?>
<?php $this->load->view('reports/no-data-found');?>
<?php } ?>

<style type="text/css">
.progress {
    background: #937070;
    border-radius: 100px;
}
</style>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>select2/select2.min.css">
<script type="text/javascript" src="<?= VENDOR_URL;?>select2/select2.full.min.js"></script>
<script type="text/javascript">
	$('.select2').select2();
	$('#table-responsive').DataTable();
	<?php if(!empty($course_id)){?>
		get_course(<?= $category_id;?>,<?= $course_id;?>);
	<?php } ?>
	function get_course_list(category_id,course_id){
		get_course(category_id,course_id);
	}
	function get_course(category_id,course_id){
		$.ajax({       
            type   : "POST",
            url    : "<?php echo site_url('ajax/get_course_by_category'); ?>",
            data   : { category_id:category_id,course_id:course_id},               
            async  : false,
            success: function(response){                                                   
                if(response)
                {
                   $('#course_id').html(response); 
                   $('.select2').select2();
                }
            }
        }); 
	}
</script>
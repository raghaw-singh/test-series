<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-body">
            	<form method="GET" action="<?php echo base_url('reports/user/index');?>">
            		<div class="col-md-3">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="user_id">User</label>
					        <select class="form-control select2" data-toggle="select2" name="user_id" id="user_id">
					            <option value="all" selected>All</option>
					            <?php foreach($userList as $user){?>
					            <option value="<?= $user->user_id;?>" <?php if(!empty($user_id)){?><?php if($user_id==$user->user_id) echo 'selected'?><?php }?>><?= $user->name;?></option>
					            <?php  } ?>
					        </select>
					    </div>
					</div>
					<!-- Course Status -->
					<div class="col-md-2">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="status"><?= get_phrase('report_type');?></label>
					        <select class="form-control select2" data-toggle="select2" name="report_type" id="report_type">
					            <option value="all" selected>All</option>
					            <?php 
					            $userReportType 	=	userReportType();
					            foreach($userReportType as $key=>$value ){?>
					            <option value="<?= $key;?>" <?php if(!empty($report_type)){?><?php if($report_type==$key) echo 'selected'?><?php }?>><?= $value;?></option>
					        	<?php } ?>
					        </select>
					    </div>
					</div>
					<div class="col-md-6">
					    <label for=".." class="text-white hidden-sm hidden-xs">..</label><br>
					    <button type="submit" class="btn btn-primary" name="button">Filter</button>
					    <?php if(has_permission(EXPORT,'reports','user')){?>
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
				<h3 class="box-title titlefix"><?= get_phrase('report_by_user');?></h3>
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
</script>
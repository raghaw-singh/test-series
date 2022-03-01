<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-body">
            	<form method="GET" action="<?php echo base_url('reports/module/index');?>">
            		<div class="col-md-3">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="category"><?= get_phrase('skill');?></label>
					        <select class="form-control select2" name="skill" id="skill" onchange="get_course_list(this.value,'','')">
					            <option value="all" <?php if(!empty($skill)){?><?php if($skill=='all') echo 'selected'?><?php } ?>>All</option>
					            <?php 
					            $level_info 	=	level_info();
					            foreach($level_info as $key=>$value ){?>
					            <option value="<?= $key;?>" <?php if(!empty($skill)){?><?php if($skill==$key) echo 'selected'?><?php }?>><?= $value;?></option>
					        	<?php } ?>
					        </select>
					    </div>
					</div>
					<!-- Course Status -->
					<div class="col-md-5">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="module"><?= get_phrase('module');?></label>
					        <select class="form-control select2" name="category_id" id="category_id">
					            <option value="all" <?php if(!empty($category_id)){?><?php if($category_id=='all') echo 'selected'?><?php } ?>>All</option>
					            <?php foreach($courseList as $list){?>
					            <option value="<?= $list->id;?>" <?php if(!empty($category_id)){?><?php if($category_id==$list->id) echo 'selected'?><?php } ?>><?= $list->name;?></option>
					            <?php } ?>
					        </select>
					    </div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">
					        <label class="hidden-sm hidden-xs" for="report_type"><?= get_phrase('report_type');?></label>
					        <select class="form-control select2" data-toggle="select2" name="report_type" id="report_type">
					        	<option value=""><?= get_phrase('select');?></option>
					            <?php 
					            $ReportType 	=	getModuleReportType();
					            foreach($ReportType as $key=>$value ){?>
					            <option value="<?= $key;?>" <?php if(!empty($report_type)){?><?php if($report_type==$key) echo 'selected'?><?php }?>><?= $value;?></option>
					        	<?php } ?>
					        </select>
					    </div>
					</div>
					<div class="col-md-2">
					    <label for=".." class="text-white hidden-sm hidden-xs">..</label><br>
					    <button type="submit" class="btn btn-primary" name="button">Filter</button>
					    <?php if(has_permission(EXPORT,'reports','module')){?>
					    <button type="submit" class="btn btn-success" name="button">Export as PDF</button>
						<?php } ?>
					</div>

            	</form>
            </div>
		</div>
	</div>
</div>
<?php if(!empty($moduleReport)){?>
<div class="row">
	<div class="col-md-12 mt-20">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title titlefix"><?= get_phrase('report_by_module');?></h3>
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
            					<?php if($report_type=='score_summary'){?>
            					<th><?= get_phrase('score_summary');?></th>
            					<?php } ?>
            				</tr>
            			</thead>
            			<tbody>
            				<?php $count=1; foreach($moduleReport as $obj){?>
            				<tr>
            					<td><?= $count;?></td>
            					<td><?= $obj->course_title;?></td>
            					<td>
            						<p>
            							<strong><?= $obj->first_name.' '.$obj->last_name;?></strong><br><?= $obj->email;?>
            						</p>
            					</td>
            					<td>
            						<?php if($report_type=='score_summary'){
            							$user_meta 			=	get_meta_data('users',$obj->user_id);
            							$watch_history_array = json_decode($user_meta->watch_history, true);
            							echo count($watch_history_array).'/'.get_all_lesson_by_course($obj->course_id);
            						} ?>
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
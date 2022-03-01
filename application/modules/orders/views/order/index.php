<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
            <div class="box-body">
            	<form method="GET" autocomplete="off" action="<?php echo base_url('orders/index');?>">
            		<div class="col-md-2">
					    <div class="form-group">
					        <select class="form-control" name="payment_status">
					        	<option value=""><?= get_phrase('payment_status');?></option>
						        <option value="pending" <?php if(!empty($payment_status)){?><?php if($payment_status=='pending') echo 'selected'?><?php } ?>><?= get_phrase('pending');?></option>
						        <option value="failed" <?php if(!empty($payment_status)){?><?php if($payment_status=='failed') echo 'selected'?><?php } ?>><?= get_phrase('failed');?></option>
						        <option value="success" <?php if(!empty($payment_status)){?><?php if($payment_status=='success') echo 'selected'?><?php } ?>><?= get_phrase('success');?></option>
					        </select>
					    </div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">
					        <input type="text" name="from_date" class="form-control datepicker" placeholder="<?= get_phrase('from_date');?>" value="<?php if(!empty($from_date)){?><?= $from_date;?><?php } ?>">
					    </div>
					</div>
					<div class="col-md-2">
					    <div class="form-group">
					        <input type="text" name="to_date" class="form-control datepicker" placeholder="<?= get_phrase('to_date');?>" value="<?php if(!empty($to_date)){?><?= $to_date;?><?php } ?>">
					    </div>
					</div>
					<div class="col-md-2">
					    <button type="submit" class="btn btn-primary btn-block" name="button">Filter</button>
					</div>
            	</form>
            </div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-12">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title titlefix"><?= get_phrase('manage_order');?></h3>
				<div class="box-tools addmeeting">
				</div>    
            </div>
            <div class="box-body">
            	<div class="table-responsive">
            		<table class="table table-striped" id="table-responsive">
            			<thead>
            				<tr>
            					<th><?= get_phrase('#');?></th>
            					<th><?= get_phrase('student_name');?></th>
            					<th><?= get_phrase('order_id');?></th>
            					<th><?= get_phrase('transaction_id');?></th>
            					<th><?= get_phrase('amount');?></th>
            					<th><?= get_phrase('method');?></th>
            					<th><?= get_phrase('status');?></th>
            					<th><?= get_phrase('date');?></th>
            					<th><?= get_phrase('action');?></th>
            				</tr>
            			</thead>
            			<tbody>
            				<?php $count=1; if(!empty($order_info)){foreach($order_info as $obj){?>
            				<tr>
            					<td><?= $count;?></td>
            					<td><?= $obj->student_name;?></td>
            					<td><?= $obj->invoice_id;?></td>
            					<td><?= $obj->transaction_id;?></td>
            					<td><?= $obj->payable_amount;?></td>
            					<td><?= $obj->payment_method;?></td>
            					<td>
            						<?php if($obj->payment_status=='success'){?>
            						<button class="btn btn-success btn-xs"><?= get_phrase('success');?></button>
            						<?php } elseif($obj->payment_status=='succeeded'){?>
            						<button class="btn btn-success btn-xs"><?= get_phrase('success');?></button>
            						<?php } elseif($obj->payment_status=='failed'){?>
            						<button class="btn btn-danger btn-xs"><?= get_phrase('failed');?></button>
            						<?php } elseif($obj->payment_status=='pending'){?>
            						<button class="btn btn-warning btn-xs"><?= get_phrase('pending');?></button>
            						<?php } elseif($obj->payment_status==''){?>
            						<button class="btn btn-info btn-xs"><?= get_phrase('not_done');?></button>
            						
            						<?php } ?>
            					</td>
            					<td><?= date($this->setting->sms_date_format,strtotime($obj->created_at));?></td>
            					<td>
            						<button class="btn btn-info btn-xs" data-toggle="tooltip" title="<?= get_phrase('view');?>" onclick="view_order_modal(<?= $obj->id;?>)"><i class="fa fa-eye"></i></button>
            					</td>
            				</tr>
            				<?php $count++; } } ?>
            			</tbody>
            		</table>
            	</div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade view_order_modal" role="dialog">
    <div class="modal-dialog modal-dialog2 modal-lg">
        <div class="modal-content fn_view_order_modal">
        </div>
    </div>
</div>
<script type="text/javascript" src="<?= VENDOR_URL;?>datepicker/js/bootstrap-datetimepicker.js"></script>
<link rel="stylesheet" type="text/css" href="<?= VENDOR_URL;?>datepicker/css/bootstrap-datetimepicker.css">
<script type="text/javascript">
	$('.datepicker').datepicker();
	$('#table-responsive').DataTable();
	function view_order_modal(order_id){
		$('.view_order_modal').modal('show');
		$('.fn_view_order_modal').html('<p style="padding: 20px;"><p style="padding: 20px;text-align:center;"><img src="<?php echo IMG_URL; ?>loading.gif" /></p>');
        $.ajax({       
            type   : "POST",
            url    : "<?php echo base_url('orders/view_order_modal'); ?>",
            data   : {order_id:order_id},
            success: function(response){                                                   
                if(response){
                    $('.fn_view_order_modal').html(response);
                }
            }
       	});
	}
</script>
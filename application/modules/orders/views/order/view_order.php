<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title"><?= get_phrase('order_id').':- #'.$order_info->invoice_id;?></h4>
</div>
<div class="modal-body">
    <div class="invoice p-3 mb-3">
	    <!-- title row -->
	    <div class="row">
	        <div class="col-12">
	            <h4>
	                <img src="<?= base_url('uploads/logo/'.$this->setting->front_logo);?>" style="width: 40px;"> <?= $this->setting->system_name;?>
	            </h4>
	        </div>
	        <!-- /.col -->
	    </div>
	    <!-- info row -->
	    <div class="row invoice-info">
	        <div class="col-sm-4 invoice-col">
	            From
	            <address>
	                <strong><?= $this->setting->system_name;?></strong><br />
	                <?= $this->setting->address;?><br />
	                Phone: <?= $this->setting->phone;?><br />
	                Email: <?= $this->setting->email;?>
	            </address>
	        </div>
	        <!-- /.col -->
	        <div class="col-sm-4 invoice-col">
	            To
	            <address>
	                <strong><?= $order_info->student_name;?></strong><br />
	                <?php if($order_info->present_address){
	                echo $order_info->present_address.'<br>';
	                } ?>
	                Phone: <?= $order_info->student_phone;?><br />
	                Email: <?= $order_info->student_email;?>
	            </address>
	        </div>
	        <!-- /.col -->
	        <div class="col-sm-4 invoice-col">
	            <b>Invoice #<?= $order_info->invoice_id;?></b><br />
	            <?php if($order_info->payment_status=='succeeded'){?>
	            <b>Status # <button class="btn btn-success btn-xs">Success</button></b><br/>
	        	<?php } elseif($order_info->payment_status=='failed'){?>
	        	<b>Status # <button class="btn btn-danger btn-xs">Failed</button></b><br/>
        		<?php }else{?>
        		<b>Status # <button class="btn btn-info btn-xs">Not Done</button></b><br/>
        		<?php } ?>
	            <b>TXN ID:</b> <?= $order_info->transaction_id;?><br />
	            <b>Payment Date:</b> <?= date($this->setting->sms_date_format,strtotime($order_info->created_at));?><br />
	        </div>
	        <!-- /.col -->
	    </div>
	    <!-- /.row -->

	    <!-- Table row -->
	    <div class="row">
	        <div class="col-12 table-responsive">
	            <table class="table table-striped">
	                <thead>
	                    <tr>
	                        <th>Sr.No</th>
	                        <th>Course Name</th>
	                        <th>Amount</th>
	                        <th>Discount</th>
	                        <th>GST <small>%</small></th>
	                        <th>GST AMT</th>
	                        <th>Subtotal</th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<?php 
	                	$sub_total_amount 	=	0;
	                	$total_gst 			=	0;
	                	$count=1; if(!empty($order_info->order_info)){foreach(json_decode($order_info->order_info) as $obj){
	                	$gst_info 	=	$this->order_model->get_single('tax_type',array('id'=>$obj->tax_id));
	                	?>
	                    <tr>
	                        <td><?= $count;?>.</td>
	                        <td><?= $obj->course_name;?></td>
	                        <td><?= number_format($obj->course_amount,2);?></td>
	                        <td><?= number_format($obj->course_discount,2);?></td>
	                        <td><?= $gst_info->name;?></td>
	                        <td>
	                        	<?php 
	                        	$amount 	=	$obj->course_amount;
	                        	$gst_per 	=	$gst_info->percentage;
	                        	$gst_amt 	=	($amount*($gst_per/100));
	                        	echo round($gst_amt);
	                        	$sub_total_amount += $amount;
	                        	$total_gst += $gst_amt;
	                        	?>
	                        </td>
	                        <td><?= number_format($obj->course_amount,2);?></td>
	                    </tr>
	                	<?php $count++; } }?>
	                </tbody>
	            </table>
	        </div>
	        <!-- /.col -->
	    </div>
	    <!-- /.row -->

	    <div class="row">
	        <div class="col-md-6"></div>
	        <div class="col-md-6">
	            <div class="table-responsive">
	                <table class="table">
	                    <tbody>
	                        <tr>
	                            <th class="text-right">Subtotal:</th>
	                            <td class="text-right"><?= $this->setting->currency_symbol.' '.number_format($sub_total_amount,2);?></td>
	                        </tr>
	                        <tr>
	                            <th class="text-right">GST</th>
	                            <td class="text-right"><?= $this->setting->currency_symbol.' '.number_format($total_gst);?></td>
	                        </tr>
	                        <tr>
	                            <th class="text-right">Total:</th>
	                            <td class="text-right"><?= $this->setting->currency_symbol.' '.$order_info->payable_amount;?></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	        <!-- /.col -->
	    </div>
	    <!-- /.row -->
	</div>

</div>
<div class="modal-footer">
</div>

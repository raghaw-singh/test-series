<?php

defined('BASEPATH') OR exit('No direct script access allowed');
class Orders extends MY_Controller {

    public $data = array();

    function __construct() {
        
        parent::__construct();
        $this->load->model('Order_Model', 'order_model', true);   
        $this->setting      =   $this->order_model->get_single('settings',array('status'=>1));
    }

    function index(){
        check_permission(VIEW);
        if($this->input->get()){
            $payment_status                             =   $this->input->get('payment_status');
            $from_date                                  =   $this->input->get('from_date');
            $to_date                                    =   $this->input->get('to_date');
            //_d($this->input->get());
            $this->data['order_info']                   =   $this->order_model->get_order_list($payment_status,$from_date,$to_date);
            $this->data['payment_status']               =   $payment_status;
            $this->data['from_date']                    =   $from_date;
            $this->data['to_date']                      =   $to_date;
        }else{
            $this->data['order_info']                   =   $this->order_model->get_order_list();
            $this->data['payment_status']               =   '';
            $this->data['from_date']                    =   '';
            $this->data['to_date']                      =   '';
        }
        $this->layout->title(get_phrase('manage_order'));
        $this->layout->view('order/index',$this->data);
    }

    function view_order_modal(){
        $order_id                       =   $this->input->post('order_id');
        if(!empty($order_id)){
            $this->data['order_info']   =   $this->order_model->get_single_order_info($order_id);
        }
        echo $this->load->view('orders/order/view_order',$this->data);
    }
}
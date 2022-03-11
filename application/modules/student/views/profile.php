<div class="row">
    <div class="col-md-4">
        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title"><?= get_phrase('profile'); ?></h3>
                <div class="box-tools pull-right">
                    <div class="has-feedback"></div>
                </div>
            </div>
            <div class="box-body">
                <div class="mailbox-controls"></div>
                <div class="row" style="margin-bottom: 20px;">
                    <div class="col-md-5">
                        <?php if(!empty($studentData->photo)){ ?>
                        <img style="border-radius: 100px; width: 160%; padding: 1px; margin-left: 72px;" class="img-responsive radioborder" src="<?= base_url('uploads/student_image/'.$studentData->photo);?>" />
                        <?php } ?>
                    </div>
                </div>
                <div class="table-responsive mailbox-messages">
                    <table class="table table-bordered table-hover table-striped">
                        <tbody>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('student_name'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->first_name.' '.$studentData->last_name ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('date_of_birth'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->date_of_birth ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('address'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->address ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('phone'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->phone ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('email'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->email ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('class'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $this->db->get_where('class',array('id'=>$studentData->class))->row()->class ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('section'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $this->db->get_where('section',array('id'=>$studentData->section))->row()->section ;?></td>
                            </tr>
                            <tr>
                                <td>
                                    <strong><?= get_phrase('roll_no'); ?></strong>
                                </td>
                                <td class="mailbox-name"><?= $studentData->roll ;?></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
  <!--   <div class="col-md-8">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#exam" data-toggle="tab">Exam</a></li>
                <li><a href="#document" data-toggle="tab">Document</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="exam">
                    <div class="panel-body profile-view-dis">
                        <div class="row">
                            <div class="tab-pane" id="exam">
                                <div id="hide-table">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Exam</th>
                                                <th>Date</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Pre Test </td>
                                                <td>26 Nov 2020 01:50:49 AM </td>
                                                <td ><span class="text-green">Pass</span></td>

                                                <td>
                                                    <button class="btn btn-info btn-xs">
                                                        <i class="fa fa-check-square-o"></i>
                                                    </button>
                                                </td>
                                            </tr>    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!--./col-md-9-->
    <div class="col-md-8">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#exam" data-toggle="tab">Exam</a></li>
                <li><a href="#document" data-toggle="tab">Document</a></li>
            </ul>

            <div class="tab-content">
                <div class="active tab-pane" id="exam">
                    <div id="hide-table">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Exam</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-title="#">
                                        1
                                    </td>
                                    <td data-title="Exam">
                                        Pre Test
                                    </td>
                                    <td data-title="Date">
                                        26 Nov 2020 01:50:49 AM
                                    </td>
                                    <td data-title="Obtained Mark">
                                        <span class="text-green">Pass</span>
                                    </td>

                                    <td data-title="Action">
                                        <button class="btn btn-info btn-xs">
                                            <span><i class="fa fa-check-square-o"></i></span>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane" id="document">
                    <div id="hide-table">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Title</th>
                                    <th>Date</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td data-title="#">
                                        1
                                    </td>

                                    <td data-title="Title">
                                        Registration
                                    </td>

                                    <td data-title="Date">
                                        25 Nov 2019
                                    </td>

                                    <td data-title="Action">
                                        <a class="btn btn-success btn-xs mrg">
                                            <i class="fa fa-download"></i>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

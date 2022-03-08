
    <title>exam</title>

    <style type="text/css">
        html,
        body {
            background: white;
            padding: 0;
            margin: 0;
        }
        
        *:fullscreen *:-ms-fullscreen,
        *:-webkit-full-screen,
        *:-moz-full-screen {
            overflow: auto !important;
        }
    </style>

</head>

<body>

    <div class="container-fluid">

        <div class="row bg-primary top nav-bar">

            <div class="col-md-4 col-xs-4">

                <!-- <p>Logo</p> -->

                <img style="max-width: 75px;margin-top: -14px;position: absolute;" src="<?php echo base_url();?>uploads/logo/1.png">

            </div>

            <div class="col-md-4 col-xs-4 text-center">

                <!-- <span style="font-weight: bold;font-size:18px;">Exam Name</span>: --><span style="font-weight: bold;font-size:18px;color:#fff;"> <?php echo $instruction->exam_title;?></span>

            </div>

            <div class="col-md-4 col-xs-4 pull-right">

                <div class="pull-right">

                    <strong><?php echo $instruction->exam_title;?></strong>
                    
                </div>

            </div>

        </div>
        <!-- row -->
        <style type="text/css">
            .agree:hover {
                background: #ccc;
            }
            
            .btn,
            .ques_links {
                display: none;
            }
            
            #minutes,
            #secs {
                font-weight: bold;
                font-size: 16px;
                color: red;
            }
        </style>
        <div class="instructions col-lg-12 col-xs-12">

            <div class="panel panel-default">

                <div class="panel-heading text-center">
                    <h4>Intructions</h4></div>
                <?php $getExamQuestion  =   getExamQuestion($instruction->id);?>
                <?php //_d($getExamQuestion);?>
                <?php if(!empty($getExamQuestion)){foreach($getExamQuestion as $row){?>
                <!-- <?php $getSubject       =   getSubject($row->subject_id);?> -->
                
                <?php //print_r($getSubject);?>
                <div class="panel-body" style="height: 520px; overflow-y: scroll;">
                	<?php _d($getExamQuestion);?>
                    <div class="col-md-4">
                        <h3>Exam Duration :-<?php echo $row->duration;?> Minutes</h3>
                    </div>
                    <div class="col-md-4">
                        <h3>Number of Questions :-<?php echo $row->question;?></h3>
                    </div>
                    <div class="col-md-4">
                        <h3>Total Marks :-<?php echo $row->subject;?></h3>
                    </div>

                    <div class="col-lg-12">
                        <div style="width: 100% !important;">
                            <?php echo $instruction->subject;?>
                        </div>
                    </div>

                    <address>&nbsp;</address>

                    <address><span style="font-size:16px"><strong>Test By - <?php echo $instruction->subject;?></strong></span></address>

                    <!-- End Question List -->

                </div>
                <?php } }?>
                <div class="panel-footer">

                    <div class="row">

                        <div class="col-sm-4">

                            <div type="button" class="btn btn-default btn-block agree" style="display: inline;text-align: left;">

                                <label>
                                    <input id="agree" type="checkbox">&nbsp;I have read the Instructions. </label>

                            </div>

                        </div>

                        <div class="col-sm-4"></div>

                        <div class="col-sm-4">

                            <button class="btn btn-default sub-btn pull-right" onclick="startExam();" style="display: inline;">Start</button>

                        </div>

                    </div>

                </div>

            </div>

        </div>           
        <input type="hidden" name="total_question" id="total_question_in_exam" value="<?php echo numberofQuestions($instruction->id);?>"> 
        <input type="hidden" name="start_time" id="start_time" value="<?php echo date('h:i:s a'); ?>">
        
        <input type="hidden" id="package_id" value="39">
        <input type="hidden" id="exam_id" name="exam_id" value="<?php echo $instruction->id;?>">
        <input type="hidden" id="total_marks" name="total_marks" value="<?php echo examTotalMarks($instruction->id);?>">
        <input type="hidden" id="subject_id" name="subject_id" value="">
        <input type="hidden" id="ques_no" name="ques_no" value="">
        <input type="hidden" id="remain_time" value="<?php echo $instruction->exam_duration;?>">
        <!-- Start Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header alert alert-warning">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Question List</h4>
                    </div>
                    <div class="modal-body" style="height: 420px; overflow-y: scroll;">
                        <table class="table">
                            <tbody>
                                <?php if(!empty($getExamQuestion)){foreach($getExamQuestion as $row){?>
                                
                                <tr>
                                    <td><?php $row->id;?></td>
                                    <td>
                                        <p><?php echo $row->question;?></p>
                                    </td>
                                </tr>
                                <?php } }?>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- End Modal -->
        <!-- Start Exam Modal -->
        <div id="examModal" class="modal fade" role="dialog">
            <div class="modal-dialog modal-lg">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header alert alert-warning">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Exam Summary</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Section Name</th>
                                    <th>No of Question</th>
                                    <th>Answered</th>
                                    <th>Not Answered</th>
                                    <th>Flag</th>
                                    <th>Not Visit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><?php echo $instruction->exam_name;?> By <?php echo $instruction->c_name;?></td>
                                    <td class="no_of_ques">0</td>
                                    <td class="no_of_ans">0</td>
                                    <td class="no_of_not_ans">0</td>
                                    <td class="no_of_flag">0</td>
                                    <td class="no_of_not_visit">0</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" onclick="exam_finish_save();">Yes</a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- End Exam Modal -->
        <!-- Start Exam Section -->
        <div class="exam_section hidden">
            <div class="row">
                <div class="col-md-9 col-xs-12">
                    <div class="panel panel-primary">
                        
                        <!-- <?php $count=1; if(!empty($getSubject)){foreach($getSubject as $subj){?>
                        <button class="btn <?php if($count=='1') { echo'btn-info'; }else{ echo 'btn-primary';}?> sub-btn subject" onclick="changeSubject(<?php echo $subj->id;?>)" rel="<?php echo $subj->id;?>"><?php echo $subj->name;?></button>
                        <?php $count++; } } ?> -->
                    </div>
                </div>
                <div class="col-md-3 col-xs-12 pull-right">
                    <div class="panel lang-timer">
                        <!-- <label>Language</label>
                <select>
                    <option>English</option>
                    <option>Hindi</option>
                </select> -->

                        <p class="small">
                            <label class="text-danger">Time Left:</label> <span id="minutes"></span> Minutes <span id="secs"></span> Seconds</p>
                        <label><?php echo ucwords($this->session->userdata('name'));?></label>
                        <?php if(!empty($this->session->userdata('photo'))){?>
                        <?php $photo            =   $this->session->userdata('photo');?>
                        <img src="<?php echo base_url('assets/uploads/employee-photo/.$photo');?>" class="img-rounded" height="36" width="36">
                        <?php } else{?>
                        <img src="<?php echo base_url();?>assets/images/default-user.png" class="img-rounded" height="36" width="36">
                        <?php } ?>
                    </div>

                </div>

            </div>
            <!-- row -->

            <div class="row">
                <!-- Start Question List -->
                <div class="divs col-md-9 col-xs-12">
                    <?php $formate = array();
                        if(!empty($getExamQuestion))
                        {
                            if($getExamQuestion['0']->rand_ques == 'Yes')
                            {
                                $keys = array_keys($getExamQuestion);
                                shuffle($keys);

                                foreach ($keys as $key)
                                {
                                    $formate[$key] = $getExamQuestion[$key];
                                }
                            
                            }
                            else
                            {
                                $formate = $getExamQuestion;
                            }
                        }
                    ?>
                    <?php $counts=1; foreach($formate as $obj){?>
                    <div class="box panel panel-default ques_<?php echo $counts;?>">
                        <div class="panel-heading">
                            <h4>Question: <?php echo $counts;?></h4></div>
                        <div class="panel-body" style="height: 60vh; overflow-y: scroll;">
                            <!-- height: 420px; -->
                            <p>
                                <p><strong><?php echo $obj->question;?></strong></p>
                            </p>
                            <input type="hidden" value="<?php echo $obj->question_id; ?>" id="questionid_<?php echo $counts; ?>">
                            <?php if(!empty($obj->option_a)){?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opt_<?php echo $obj->question_id;?>" value="<?php echo $obj->option_a;?>"> <?php echo $obj->option_a;?></label>
                            </div>
                            <?php } if(!empty($obj->option_b)){?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opt_<?php echo $obj->question_id;?>" value="<?php echo $obj->option_b;?>"> <?php echo $obj->option_b;?> </label>
                            </div>
                            <?php } if(!empty($obj->option_c)){?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opt_<?php echo $obj->question_id;?>" value="<?php echo $obj->option_c;?>"> <?php echo $obj->option_c;?> </label>
                            </div>
                            <?php } if(!empty($obj->option_d)){?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opt_<?php echo $obj->question_id;?>" value="<?php echo $obj->option_d;?>"> <?php echo $obj->option_d;?></label>
                            </div>
                            <?php } if(!empty($obj->option_e)){?>
                            <div class="radio">
                                <label>
                                    <input type="radio" name="opt_<?php echo $obj->question_id;?>" value="<?php echo $obj->option_e;?>"> <?php echo $obj->option_e;?></label>
                            </div>
                            <?php  } ?>
                        </div>
                        <div class="panel-footer">
                            <button class="btn btn-info sub-btn" onclick="flagAndNext(<?php echo $obj->question_id;?>)">Flag and Next</button>
                            <button class="btn btn-default sub-btn" onclick="clearAnswer(<?php echo $obj->question_id;?>)">Clear Answer</button>
                            <button class="btn btn-success sub-btn prev">Previous</button>
                            <button class="btn btn-primary sub-btn pull-right" onclick="saveAndNext(<?php echo $obj->question_id;?>)">Save and Next</button>
                            <button class="btn btn-success sub-btn hidden">View Answer</button>
                        </div>

                    </div>
                    <?php $counts++; } ?>
                    <!-- End Question List -->
                </div>
                <div class="col-md-3 col-xs-12 pull-right">
                    <div class="well" style="background:rgb(122, 218, 244);">
                        <div class="panel panel-default">
                            <div class="ques_links panel-body" style="height:312px;padding: 2px; ;overflow-y: scroll;">
                                <!-- height:156px -->
                                <!-- Start Question Links -->
                                <?php $count=1; foreach($formate as $obj_1){?>
                                <span id="<?php echo $obj_1->question_id;?>" class="btn-ans no-visit" rel="<?php echo $obj_1->subject_id;?>" onclick="getQuesLinks(<?php echo $count;?>)"><?php echo $count;?></span>
                                <?php $count++; }?>
                                <!-- End Question Links -->
                                <!-- <span class="btn-ans no-visit">1</span>
                        <span class="btn-ans no-ans">2</span>
                        <span class="btn-ans mark-review">3</span>
                        <span class="btn-ans ans">4</span>
                        <span class="btn-ans ans-mark-review">5</span> -->
                            </div>
                            <!-- panel-body -->

                        </div>
                        <!-- panel -->

                        <!-- <label>Filter:</label>
                <select>
                    <option>Not Visited</option>
                    <option>Not Answered</option>
                    <option>Marked for Review</option>
                    <option>Answered</option>
                    <option>Answered and Marked for Review</option>
                </select> -->

                        <h4>Legends:</h4>
                        <img class="total_answer" src="<?php echo base_url();?>template/exam/img/ans.png"> Answered &nbsp; &nbsp; <img src="<?php echo base_url();?>template/exam/img/no-ans.png"> Not Answered
                        <br>
                        <img src="<?php echo base_url();?>template/exam/img/no_visit.png"> Not Visited &nbsp; &nbsp; <img src="<?php echo base_url();?>template/exam/img/mark_review.png"> Flag for Review
                        <br>
                        <!-- <img src="https://aagebadho.in/dist/exam/css/img/ans_mark_review.png"> Answered &amp; Marked for Review<br> -->
                        <br>
                        <button class="btn btn-primary hidden">Profile</button>
                        <button class="btn btn-primary hidden">Instructions</button>
                        <button id="next" class="btn btn-primary hidden" style="width: 49%!important;">Next</button>
                        <button class="btn btn-primary" style="width: 49%!important;" data-toggle="modal" data-target="#myModal">Question</button>
                        <button class="btn btn-success" style="width: 49%!important;" onclick="showExamSummary()">Submit</button>
                        <!--<button id="prev" class="btn btn-info" style="width: 49%!important;">Prev</button>
                <button class="btn btn-danger" style="width: 49%!important;" onclick="closeMe()">Exit</button> -->
                    </div>
                    <!-- well -->

                </div>

            </div>
            <!-- row -->
        </div>
        <!-- End Exam Section -->
        <script type="text/javascript">
            function closeMe() {
                window.opener = self;
                window.close();
            }

            function toggleFullScreen(elem) {
                if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
                    if (elem.requestFullScreen) {
                        elem.requestFullScreen();
                    } else if (elem.mozRequestFullScreen) {
                        elem.mozRequestFullScreen();
                    } else if (elem.webkitRequestFullScreen) {
                        elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
                    } else if (elem.msRequestFullscreen) {
                        elem.msRequestFullscreen();
                    }
                } else {
                    if (document.cancelFullScreen) {
                        document.cancelFullScreen();
                    } else if (document.mozCancelFullScreen) {
                        document.mozCancelFullScreen();
                    } else if (document.webkitCancelFullScreen) {
                        document.webkitCancelFullScreen();
                    } else if (document.msExitFullscreen) {
                        document.msExitFullscreen();
                    }
                }
            }

            function startExam() {
                var rdo = $('#agree:checked').val();
                if (rdo) {
                    //toggleFullScreen(document.body); // Full Screen
                    $('.instructions').addClass('hidden');
                    $('.exam_section').removeClass('hidden');
                    startTimer(); // Timer Start
                    interval = setInterval(function() {
                        minutes = $('#minutes').text();
                        secs = $('#secs').text();
                        if (parseInt(secs) > 0) { // Start Timer
                            $('.btn,.ques_links').show();
                            clearInterval(interval);
                            currentQuestion();
                        }
                    }, 1000);
                }
            }
            $(function() {
                $(".divs .box").each(function(e) {
                    if (e != 0)
                        $(this).hide();
                });

                $("#next").click(function() { // Next
                    if ($(".divs .box:visible").next().length != 0) {
                        $(".divs .box:visible").next().show().prev().hide();
                        currentQuestion();
                    } else {
                        $(".divs .box:visible").hide();
                        $(".divs .box:first").show();
                    }
                    return false;
                });

                $("#prev,.prev").click(function() { // Preview
                    if ($(".divs .box:visible").prev().length != 0) {
                        $(".divs .box:visible").prev().show().next().hide();
                        currentQuestion();
                    } else {
                        $(".divs .box:visible").hide();
                        $(".divs .box:last").show();
                    }
                    return false;
                });

            })
        </script>
    </div>
    <script type="text/javascript" src="<?php echo base_url('assets/exam/exam.js');?>"></script>
    <!--
    <script type="text/javascript">
        $(function() {
            //Copy, Paste
            $('body').bind('copy paste', function(e) {
                e.preventDefault();
                return false;
            });
            $(this).bind("contextmenu", function(e) {
                e.preventDefault();
            });
        })
    </script>
    <noscript>Your browser does not support JavaScript!</noscript>
    -->
</body>

</html>
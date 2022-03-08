<section class="panel">
    <div class="panel-body bio-graph-info">
        <div class="box-body">
            <div class="row">
                <div class="col-sm-12">
                    <div class="clearfix">
                        <div class="question-body">
                            <label class="lb-content question-color">
                                <h3><?= $question_bank_info->question ;?></h3>
                            </label>
                            <label class="pull-right" style="margin-left: 309px;"> Marks- <?= $question_bank_info->mark ;?></label>
                        </div>
                        <div>
                            <?php if($question_bank_info->upload){ ?>
                            <img
                                style="width: 220px; height: 120px;"
                                src="<?= base_url().'uploads/question_bank/'.$question_bank_info->upload ;?>" alt="image"/>
                            <?php }?>
                        </div><br><br>
                        <div class="question-answer">
                            <table class="table">
                                <?php foreach($answers_info  as  $obj) {?>
                                <tr>
                                    <td>
                                        <input type="radio" disabled <?php if($obj->answers) echo 'checked' ;?> />
                                        <label>
                                            <span class="fa-stack radio-button"></span>
                                            <span><?= $obj->options ?></span>
                                            <?php
                                                $image    =    $obj->images ;
                                                $ext = pathinfo($image, PATHINFO_EXTENSION);
                                            ?>
                                            <?php if($image) {?>
                                                <?php if($ext == 'mp4' || $ext=='webm'){ ?>
                                                <video style="width: 160px; margin-left: 55px;" controls>
                                                    <source src="<?= base_url().'uploads/question-images/'.$image ?>" type="video/<?= $ext;?>" >
                                                </video>
                                                <?php }?>
                                                <?php if($ext == 'png' || $ext=='jpg' || $ext=='jpeg'){ ?>
                                                <img style="width: 130px; margin-left: 55px;" src="<?= base_url().'uploads/question-images/'.$image ?>" alt="image">
                                                <?php }?> 
                                            <?php }?>
                                        </label>
                                    </td>
                                </tr>
                                <?php }?>
                            </table>
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>
</section>

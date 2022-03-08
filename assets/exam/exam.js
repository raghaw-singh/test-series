function startTimer() {

    var timer2 = $('#remain_time').val(); //"09:45";

    var interval = setInterval(function() {

        var timer = timer2.split(':');

        //by parsing integer, I avoid all extra string processing

        var minutes = parseInt(timer[0], 10);

        var seconds = parseInt(timer[1], 10) || 0;

        --seconds;

        minutes = (seconds < 0) ? --minutes : minutes;

        if (minutes < 0) clearInterval(interval);

        seconds = (seconds < 0) ? 59 : seconds;

        seconds = (seconds < 10) ? '0' + seconds : seconds;

        //minutes = (minutes < 10) ?  minutes : minutes;

        $('#minutes').html(minutes); //$('#times').html(minutes + ':' + seconds);

        $('#secs').html(seconds);

        timer2 = minutes + ':' + seconds;

        if (timer2 == '0:00' || timer2 == '-1:59') {

            exam_finish_save();

        }

    }, 1000);

}

function getQuesLinks(ques_no) { // Question No by Question Links Listed

    $(".ques_links span").each(function() { // Question Links

        if ($(this).text() == ques_no) {

            // Subject Actived

            subjectId = $(this).attr('rel');

            $('.subject').removeClass('btn-info').addClass('btn-primary');

            $('.subject[rel=' + subjectId + ']').removeClass('btn-primary').addClass('btn-info');

            $('#subject_id').val(subjectId);

            $('#ques_no').val(ques_no);

            // Question Links Actived

            if ($(this).attr('class') == 'btn-ans no-visit') {

                questionId = $(this).attr('id');

                questionSave(3, questionId); // Not Answer

                $(this).removeClass('ans no-ans no-visit mark-review').addClass('no-ans');

            }

            $('.divs .box').hide();

            $('.ques_' + ques_no).show();

        }

    });

}

function currentQuestion() { // Visible Question Listed

    str = $('.divs .box:visible').attr('class');

    ques_no = str.replace('box panel panel-default ques_', '');

    getQuesLinks(ques_no);

}

function changeSubject(subjectId) { // Change Question Subjectwise

    currentQuestion();

    ques_no = $('.ques_links span[rel=' + subjectId + ']:first').text();

    getQuesLinks(ques_no);

}

function flagAndNext(questionId) { // Flag and Next

    var rdo = $('input[name=opt_' + questionId + ']:checked').val();

    if (rdo) {

        questionSave(2, questionId); // Flag for review

        $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('mark-review');

    }

    $('#next').click();

}

function clearAnswer(questionId) { // Clear Answer

    $('input[name=opt_' + questionId + ']').attr('checked', false);

    questionSave(3, questionId);

    $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('no-ans');

}

function saveAndNext(questionId) { // Save and Next
    var rdo = $('input[name=opt_' + questionId + ']:checked').val();

    if (rdo) {

        questionSave(1, questionId); // Answered

        $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('ans');

    }

    $('#next').click();

}

function questionSave(type, questionId) {

    exam_id = $('#exam_id').val();
    subject_id=$('#subject_id').val();
    total_answer = $('.ques_links span[class="btn-ans ans"]').length || 0;
    total_not_answer = $('.ques_links span[class="btn-ans no-ans"]').length || 0;
    total_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;
    total_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;
    ques_no = $('#ques_no').val();

    rdo = $('input[name=opt_' + questionId + ']:checked').val();
    if (rdo)
        answer = rdo;
    else
        answer = 0;
    time = $('#minutes').text() + ':' + $('#secs').text();
    $(".total_answer").text(total_answer);
    $(".total_not_answer").text(total_not_answer);
    $('.total_not_visit').text(total_not_visit);
    $('.total_flag').text(total_flag);
    console.log(total_answer);
    $.ajax({

        type: 'POST',

        url: base_url+'welcome/question_save',
        data: '&ques_id=' + questionId + '&exam_id=' + exam_id + '&question_no=' + ques_no + '&time=' + time + '&answer=' + answer+ '&subject_id=' + subject_id,

        success: function(resultData) {

            $('.ans'+ID).removeClass('btn-answer btn-not-answer btn-flag');

            if(type==1){ // Answer

              $('.ans'+ID).addClass('btn-answer');

            }else if(type==2){ // Flag

              $('.ans'+ID).addClass('btn-flag');

              $("input[name=opt"+ID+"]").prop('checked', false);

            }else if(type==3){ // Not Answer

              $('.ans'+ID).addClass('btn-not-answer');

              $("input[name=opt"+ID+"]").prop('checked', false);

            }
        }

    });

}

function exam_finish_save() {
    package_id = $('#package_id').val();
    exam_id = $('#exam_id').val();
    var start_time      =   $("#start_time").val();
    total_question = $('.ques_links span').length || 0;
    total_answer = $('.ques_links span[class="btn-ans ans"]').length || 0;
    total_not_answer = $('.ques_links span[class="btn-ans no-ans"]').length || 0;
    total_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;
    total_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;
    var total_marks     =   $("#total_marks").val();



    console.log(exam_id,start_time,total_question,total_answer,total_not_visit,total_not_answer,total_flag,total_marks);
    $.ajax({

        type: 'POST',

        url: base_url+'welcome/exam_finish_save/'+exam_id,
        data:'&exam_id=' + exam_id + '&total_question=' + total_question+ '&total_answer=' + total_answer+ '&total_not_answer=' + total_not_answer+ '&total_not_visit=' + total_not_visit+ '&total_flag=' + total_flag+ '&total_marks=' + total_marks+ '&start_time=' + start_time,

        success: function(data) {
            var getRes      =   $.parseJSON(data);
            if(getRes.status=='true'){
                if(getRes.result=='Yes'){
                    window.location.href = base_url+"welcome/viewResult/"+ exam_id;
                }else{
                    window.location.href = base_url+"welcome/thankyou/";
                }
            }else{
                alert('Some kind of Error Occured !');
            }
        }
    });
    // }

}

function showExamSummary() {

    $('#examModal').modal('show');

    no_of_ques = $('.ques_links span').length || 0;

    no_of_ans = $('.ques_links span[class="btn-ans ans"]').length || 0;

    no_of_not_ans = $('.ques_links span[class="btn-ans no-ans"]').length || 0;

    no_of_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;

    no_of_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;

    $('.no_of_ques').text(no_of_ques);

    $('.no_of_ans').text(no_of_ans);

    $('.no_of_not_ans').text(no_of_not_ans);

    $('.no_of_flag').text(no_of_flag);

    $('.no_of_not_visit').text(no_of_not_visit);

}function startTimer() {

    var timer2 = $('#remain_time').val(); //"09:45";

    var interval = setInterval(function() {

        var timer = timer2.split(':');

        //by parsing integer, I avoid all extra string processing

        var minutes = parseInt(timer[0], 10);

        var seconds = parseInt(timer[1], 10) || 0;

        --seconds;

        minutes = (seconds < 0) ? --minutes : minutes;

        if (minutes < 0) clearInterval(interval);

        seconds = (seconds < 0) ? 59 : seconds;

        seconds = (seconds < 10) ? '0' + seconds : seconds;

        //minutes = (minutes < 10) ?  minutes : minutes;

        $('#minutes').html(minutes); //$('#times').html(minutes + ':' + seconds);

        $('#secs').html(seconds);

        timer2 = minutes + ':' + seconds;

        if (timer2 == '0:00' || timer2 == '-1:59') {

            exam_finish_save();

        }

    }, 1000);

}

function getQuesLinks(ques_no) { // Question No by Question Links Listed

    $(".ques_links span").each(function() { // Question Links

        if ($(this).text() == ques_no) {

            // Subject Actived

            subjectId = $(this).attr('rel');

            $('.subject').removeClass('btn-info').addClass('btn-primary');

            $('.subject[rel=' + subjectId + ']').removeClass('btn-primary').addClass('btn-info');

            $('#subject_id').val(subjectId);

            $('#ques_no').val(ques_no);

            // Question Links Actived

            if ($(this).attr('class') == 'btn-ans no-visit') {

                questionId = $(this).attr('id');

                questionSave(3, questionId); // Not Answer

                $(this).removeClass('ans no-ans no-visit mark-review').addClass('no-ans');

            }

            $('.divs .box').hide();

            $('.ques_' + ques_no).show();

        }

    });

}

function currentQuestion() { // Visible Question Listed

    str = $('.divs .box:visible').attr('class');

    ques_no = str.replace('box panel panel-default ques_', '');

    getQuesLinks(ques_no);

}

function changeSubject(subjectId) { // Change Question Subjectwise

    currentQuestion();

    ques_no = $('.ques_links span[rel=' + subjectId + ']:first').text();

    getQuesLinks(ques_no);

}

function flagAndNext(questionId) { // Flag and Next

    var rdo = $('input[name=opt_' + questionId + ']:checked').val();

    if (rdo) {

        questionSave(2, questionId); // Flag for review

        $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('mark-review');

    }

    $('#next').click();

}

function clearAnswer(questionId) { // Clear Answer

    $('input[name=opt_' + questionId + ']').attr('checked', false);

    questionSave(3, questionId);

    $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('no-ans');

}

function saveAndNext(questionId) { // Save and Next
    var rdo = $('input[name=opt_' + questionId + ']:checked').val();

    if (rdo) {

        questionSave(1, questionId); // Answered

        $('#' + questionId).removeClass('ans no-ans no-visit mark-review').addClass('ans');

    }

    $('#next').click();

}

function questionSave(type, questionId) {

    exam_id = $('#exam_id').val();
    subject_id=$('#subject_id').val();
    total_answer = $('.ques_links span[class="btn-ans ans"]').length || 0;
    total_not_answer = $('.ques_links span[class="btn-ans no-ans"]').length || 0;
    total_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;
    total_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;
    ques_no = $('#ques_no').val();

    rdo = $('input[name=opt_' + questionId + ']:checked').val();
    //console.log(rdo);
    if (rdo){
        answer = rdo;
    }
    else{
        answer = 0;
    }
    var ID =    '';
    time = $('#minutes').text() + ':' + $('#secs').text();
    $(".total_answer").text(total_answer);
    $(".total_not_answer").text(total_not_answer);
    $('.total_not_visit').text(total_not_visit);
    $('.total_flag').text(total_flag);
    console.log(exam_id,subject_id,total_answer,ques_no,questionId,time,answer);
    $.ajax({

        type: 'POST',

        url: base_url+'web/students/question_save',
        data: '&ques_id=' + questionId + '&exam_id=' + exam_id + '&question_no=' + ques_no + '&time=' + time + '&answer=' + answer+ '&subject_id=' + subject_id,
        success: function(resultData) {

            $('.ans'+ID).removeClass('btn-answer btn-not-answer btn-flag');

            if(type==1){ // Answer

              $('.ans'+ID).addClass('btn-answer');

            }else if(type==2){ // Flag

              $('.ans'+ID).addClass('btn-flag');

              $("input[name=opt"+ID+"]").prop('checked', false);

            }else if(type==3){ // Not Answer

              $('.ans'+ID).addClass('btn-not-answer');

              $("input[name=opt"+ID+"]").prop('checked', false);

            }
        }

    });

}

function exam_finish_save() {
    package_id = $('#package_id').val();
    exam_id = $('#exam_id').val();
    var start_time      =   $("#start_time").val();
    total_question = $('.ques_links span').length || 0;
    total_answer = $('.ques_links span[class="btn-ans ans"]').length || 0;
    total_not_answer = $('.ques_links span[class="btn-ans no-ans"]').length || 0;
    total_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;
    total_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;
    var total_marks     =   $("#total_marks").val();



    console.log(exam_id,start_time,total_question,total_answer,total_not_visit,total_not_answer,total_flag,total_marks);
    $.ajax({
        type: 'post',
        url: base_url+'web/students/exam_finish_save',
        data:'&exam_id=' + exam_id + '&total_question=' + total_question+ '&total_answer=' + total_answer+ '&total_not_answer=' + total_not_answer+ '&total_not_visit=' + total_not_visit+ '&total_flag=' + total_flag+ '&total_marks=' + total_marks+ '&start_time=' + start_time,

        success: function(data) {
            var getRes      =   $.parseJSON(data);
            if(getRes.status=='true'){
                if(getRes.result=='Yes'){
                    window.location.href = base_url+"web/students/viewResult/"+ exam_id;
                }else{
                    window.location.href = base_url+"web/students/thankyou/";
                }
            }else{
                alert('Some kind of Error Occured !');
            }
        }
    });
    // }

}

function showExamSummary() {

    $('#examModal').modal('show');

    no_of_ques = $('.ques_links span').length || 0;

    no_of_ans = $('.ques_links span[class="btn-ans ans"]').length || 0;

    no_of_not_ans = $('.ques_links span[class="btn-ans no-ans"]').length || 0;

    no_of_flag = $('.ques_links span[class="btn-ans mark-review"]').length || 0;

    no_of_not_visit = $('.ques_links span[class="btn-ans no-visit"]').length || 0;

    $('.no_of_ques').text(no_of_ques);

    $('.no_of_ans').text(no_of_ans);

    $('.no_of_not_ans').text(no_of_not_ans);

    $('.no_of_flag').text(no_of_flag);

    $('.no_of_not_visit').text(no_of_not_visit);

}

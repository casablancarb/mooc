$(function(){
  $('.question-form').bind('ajax:success', function(evt, data){
    var questionId  = data.question_id;
    $('[data-question='+questionId+']')
      .toggleClass('text-success', data.truth_value)
      .toggleClass('text-danger', !data.truth_value)
      .toggleClass('text-warning', false)
      .html(data.explanation);
  });

  $('.question-form').bind('ajax:beforeSend', function(){
    $(this).next('.explanation')
      .toggleClass('text-success', false)
      .toggleClass('text-danger', false)
      .toggleClass('text-warning', true)
      .html('Thinking...');
  });
});

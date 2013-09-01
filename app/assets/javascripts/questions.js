$(function(){
  $(document).on('click', '.question-form input[type="radio"]', function(){
    $(this).closest('form').submit();
  });

  $(document).on('ajax:success', '.question-form', function(evt, data){
    var questionId  = data.question_id;
    $('[data-question='+questionId+']')
      .toggleClass('text-success', data.truth_value)
      .toggleClass('text-danger', !data.truth_value)
      .toggleClass('text-warning', false)
      .html(data.explanation);
  });

  $(document).on('ajax:beforeSend', '.question-form', function(){
    $(this).next('.explanation')
      .toggleClass('text-success', false)
      .toggleClass('text-danger', false)
      .toggleClass('text-warning', true)
      .html('Thinking...');
  });
});

$(function(){
    /*
  $('form').submit(function() {
    alert("submiiiit");

    var valuesToSubmit = $(this).serialize();

    $.ajax({
      url: $(this).attr('action'), //sumbits it to the given url of the form
      data: valuesToSubmit,
      method: 'POST',
      dataType: "JSON" // you want a difference between normal and ajax-calls, and json is standard
    }).success(function(json){
      alert("payloooad");
      //act on result.
    });
    return false; // prevents normal behaviour
  });
 */

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

$(document).on("ready", function(){

  $('#answers-form form').on('submit', function(event){
    event.preventDefault();
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      url: $('#answers-form form').attr("action"),
      type: "POST",
      data: valuesToSubmit,
    }).done(function(response) {
      $('#answers-form form textarea').val('');
      $('.answers-list').append(response);
    }).fail(function(response) {
      console.log("FAILURE");
    });
  });

});

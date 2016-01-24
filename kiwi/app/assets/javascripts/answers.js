$(document).on("ready", function(){

  $('#answers-form').on('submit', function(event){
    event.preventDefault();

    $.ajax({
      url: $('#answers-form form').attr("action"),
      type: "POST",
      data: $(this).serialize()
    }).done(function(response) {
      console.log("Success!")
      $('.answers-list').append(response);
    }).fail(function(response) {
      console.log("FAILURE")
    });
  });

});

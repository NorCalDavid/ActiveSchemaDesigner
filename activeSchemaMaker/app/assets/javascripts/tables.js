
$(document).ready(function(){

  $(".draggable").draggable();

  $(".sortable").sortable();

  $("#hasone-relationships-form")
    .on('ajax:success', function(event, data, xhr){
      var response = data;
      var primary_port = $("")
    })
    .on('ajax:error', function(event) {
      console.error('failed to create relationship', arguments);
    })
  });

  // var $form = $("#main-form");
  // $form.on("submit", function(e){
  //   // debugger;
  //   e.preventDefault();
  //   var promise = $.post("/tables", $form.serialize());

  //   promise.done(function(response){
  //     $(".canvas").append(response);
  //     $form[0].reset();
  //   });
  // });

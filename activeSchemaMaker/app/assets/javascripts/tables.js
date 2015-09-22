
$(document).ready(function(){

  $(".draggable").draggable();

  $(".sortable").sortable();

  // main toolbar form submits new table
  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      $(".canvas").append(response);
      $(".draggable").draggable();
      $('#create-table-form').reset();
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
    });

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

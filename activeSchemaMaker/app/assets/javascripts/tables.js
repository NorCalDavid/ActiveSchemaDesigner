// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

  $(".sortable").sortable();

  // // main toolbar form submits new table
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

  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      $(".canvas").append(response);
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
      debugger
    });


});


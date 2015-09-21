// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

  $(".sortable").sortable();

  // main toolbar form submits new table
  var $form = $("#main-form");
  $form.on("submit", function(e){
    // debugger;
    e.preventDefault();
    var promise = $.post("/tables", $form.serialize());

    promise.done(function(response){
      $(".canvas").append(response);
      $form[0].reset();
    });
  });

});
  // $('#nifty-form').on('ajax:success', function(e, data, status, xhr) {
  //   debugger;
  //   console.log(xhr);
  //   $("body").append(xhr.responseText)
  // })
  // .on("ajax:error", function(e, xhr, status, error){
  //   $("body").append(error);
  // })

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function(){

$(document).on('click', 'form .add_fields', function(e) {
  time = new Date().getTime();
  regex = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regex, time));
  e.preventDefault();
});

$(document).on('click', 'form .btn-add-comments', function(e) {
  e.preventDefault();
  $('form .comments-field').toggle()
});

  $(".sortable").sortable();

  // main toolbar form submits new table
  var $form = $("#main-form");
  $form.on("submit", function(e){
    // debugger;
    e.preventDefault();
    var promise = $.post("/tables", $form.serialize());

    promise.done(function(response){
      $("body").append(response);
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

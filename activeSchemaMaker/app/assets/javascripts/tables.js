// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

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

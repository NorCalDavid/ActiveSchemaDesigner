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

$('#main-form').on('click', 'a.btn-validations', function(e) {
  e.preventDefault();
  $(e.target).closest('table').siblings('div').toggle();
  //$('form .validations').toggle()
});

});

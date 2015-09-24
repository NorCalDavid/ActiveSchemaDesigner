$(document).ready(function(){

  $(document).on('click', 'form .add_fields', function(e) {
    var time = new Date().getTime();
    var regex = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regex, time));
    e.preventDefault();
    // $('div.validation-options').hide()
  });



});

// validation-options

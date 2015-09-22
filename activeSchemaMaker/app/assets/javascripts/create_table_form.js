$(document).ready(function(){

  $(document).on('click', 'form .add_fields', function(e) {
    time = new Date().getTime();
    regex = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regex, time));
    e.preventDefault();
    // $('div.validation-options').hide()
  });

  $(document).on('click', '#create-table-form .btn-add-comments', function(e) {
    e.preventDefault();
    $('#create-table-form .comments-field').toggle()
  });

  $(document).on('click', 'a.btn-validations', function(e) {
    e.preventDefault();
    $(e.target).closest('h3').siblings('div').toggle();
  });

  $(function() {
    $( "#accordion" ).accordion({
      heightStyle: "content",
      collapsible: true
    });
  });

  $(function() {
    $( "#tabs" ).tabs();
  });



});

// validation-options
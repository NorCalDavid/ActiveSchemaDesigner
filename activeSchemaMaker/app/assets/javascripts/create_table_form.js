$(document).ready(function(){

  $(document).on('click', 'form .add_fields', function(e) {
    time = new Date().getTime();
    regex = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regex, time));
    e.preventDefault();
  });

  $(document).on('click', '#create-table-form .btn-add-comments', function(e) {
    e.preventDefault();
    debugger;
    $('form #create-table-form .comments-field').toggle()
  });

  $('form #create-table-form').on('click', 'a.btn-validations', function(e) {
    e.preventDefault();
    // $(e.target).closest('table').siblings('div').toggle();
    $('form #fields-fields-form .validations').toggle()
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

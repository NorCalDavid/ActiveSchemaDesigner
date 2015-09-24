$(document).ready(function(){

  $(document).on('click', 'form .add_fields', function(e) {
    var time = new Date().getTime();
    var regex = new RegExp($(this).data('id'), 'g');
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

  function resetCreateTableForm() {
    $('#create-table-form')[0].reset();
  };

  $(document).on('click', '#create-table-form .btn-ResetCTForm', function(event) {
    event.preventDefault();
    resetCreateTableForm();
  });

});

// validation-options

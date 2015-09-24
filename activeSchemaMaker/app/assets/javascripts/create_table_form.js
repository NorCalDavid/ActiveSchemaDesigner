$(document).ready(function(){

  $(document).on('click', 'form .add_fields', function(event) {
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

  // main toolbar form submits new table
  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      $(".canvas").append(response);
      $(".draggable").draggable();
      // $('#create-table-form').reset();
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
    });

  function resetCreateTableForm() {
    $('#create-table-form').reset();
  };

  $(document).on('click', '#create-table-form .btn-ResetCTForm', function(event) {
    $(event.target).preventDefault();
    resetCreateTableForm();
  });
});

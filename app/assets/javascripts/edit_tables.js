$(document).on('click', '.displayable-table button.btn-edit-table', function(event) {

  event.preventDefault();
    var tableID = event.target.id.slice(2);
    var route = "/tables/" + tableID + "/edit";
    console.log(tableID);
    var request = $.get(route);

  request.done(function(response){
    $("#dialog").html(response);
    $("#dialog").dialog();
  });

  request.fail(function(response) {
    console.log(response);
  });

});

//consider adding update to prevent losing unsaved changes when adding new field
$(document).on('click', '#modal-add-field-button', function(event) {

  event.preventDefault();
    var tableRoute = $("#edit-table-form").attr("action");
    var route = tableRoute + "/fields/new";
    
    var request = $.get(route);
      request.done(function(response){
        console.log(response);
        reDrawModal();
        $("#dialog").append(response);
        $("#dialog").dialog();
      });

      request.fail(function(response) {
        console.log(response);
        $("#dialog").append("Not a successful response");
      });
});



$(document).on('click', '.modal-delete-field-id', function(event) {
  event.preventDefault();
    var tableRoute = $("#edit-table-form").attr("action");
  // debugger;
    var fieldId = $(this).attr("data-field-fieldid");
    console.log(fieldId);
    var fieldroute = tableRoute + "/fields/" + fieldId;
  
    console.log(fieldroute);

    $.ajax({
        type: "POST",
        url: fieldroute,
        data: {"_method":"delete"},
        complete: function(){
            reDrawModal();
        }
    });
    event.preventDefault();
});
   
// display permanent changes on working canvas after closing modal form
$(document).on('click', '.ui-dialog-titlebar-close', function(event) {
    reloadCanvas();

});

// table controller not properly redirecting upon submit -code below still doesn't do the trick
$(document).on('click', '#modal-update-button', function(event) {
            $("#dialog").dialog('close');
    location.reload(true);
    console.log("got to modal update button js");
    // reloadCanvas();

});

reDrawModal = function(){
    console.log('got to reDrawModal');
    var tableRoute = $("#edit-table-form").attr("action");
    var route = tableRoute + "/edit";
    var request = $.get(route);
    

  request.done(function(request){
    $("#dialog").html(request);
  });

  request.fail(function(response) {
    console.log('reDrawModal response failed');
    console.log(response);
  });
  
  return;
  };
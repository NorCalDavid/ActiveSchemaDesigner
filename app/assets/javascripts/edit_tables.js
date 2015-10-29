$(document).on('click', '.displayable-table button.btn-edit-table', function(event) {

  event.preventDefault();
    var tableID = event.target.id.slice(2);
    // debugger;
    var route = "/tables/" + tableID + "/edit";
    console.log(tableID);
    // debugger;
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
// note --- there is not currently a .modal-delete-field-id element(s)
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
        // dataType: "html",
        data: {"_method":"delete"},
        complete: function(){
            reDrawModal();
        }
    });
    event.preventDefault();
});
    

reDrawModal = function(){
    console.log('got to reDrawModal');
    // debugger;
    var tableRoute = $("#edit-table-form").attr("action");
  // debugger;
    var route = tableRoute + "/edit";
    // debugger;
    var request = $.get(route);
    

  request.done(function(request){
    $("#dialog").html(request);
    //asynchronous nature has these #diaglog re-writes come after function where called
    // $("#dialog").append("show timing from redrawmodal");    
  });

  request.fail(function(response) {
    console.log('reDrawModal response failed');
    console.log(response);
  });
  
  return;
  };
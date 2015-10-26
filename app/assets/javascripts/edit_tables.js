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

//below is not working correctly... should redo modal form with new
//new field ready to fill out.  Response in field controller won't find
//partial in tables views file

$(document).on('click', '#modal-add-field-button', function(event) {

  console.info('try for new');

  // event.preventDefault();
    var tableRoute = $("#edit-table-form").attr("action");
  //   // debugger;
    console.log(tableRoute);
    var route = tableRoute + "/fields/new";
    
    // debugger;
    var request = $.get(route);

  request.done(function(response){
    console.log(response);
    $("#dialog").html(response);
    $("#dialog").dialog();
  });

  request.fail(function(response) {
    console.log(response);
  })

});

//more watchers should possibly replace delete field as well
//however updating canvas and leaving modal window open might be 
//even better.

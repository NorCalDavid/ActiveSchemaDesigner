$(document).on('click', '.displayable-table button.btn-edit-table', function(event) {

  console.info('EDIT CLIECKED')

  event.preventDefault();
    var tableID = event.target.id.slice(2)
    var route = "/tables/" + tableID + "/edit"
    var request = $.get(route);

  request.done(function(response){
    $("#dialog").append(response);
    $("#dialog").dialog();
  });

  request.fail(function(response) {
    console.log(response);
  })

});

$(document).ready(function(){

  $(document).on('click', '.displayable-table button.btn-edit-table', function(event) {
    event.preventDefault();
      var tableID = event.target.id.slice(2)
      var route = "/tables/" + tableID + "/edit"
      var promise = $.get(route);

      promise.done(function(response){
        $("#dialog").append(response);
        $( "#dialog").dialog();
      });

      promise.fail(function(response) {
        console.log(response);
      })

    });


});


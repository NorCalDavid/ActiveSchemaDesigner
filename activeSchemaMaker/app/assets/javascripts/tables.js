
$(document).ready(function(){

  $(".draggable").draggable();

  $(".sortable").sortable();

  $("#hasone-relationships-form")
    .on('ajax:success', function(event, response, xhr){
      var response = response;
      var primary_port = $("")
    })
    .on('ajax:error', function(event) {
      console.error('failed to create relationship', arguments);
    })
  });

    //var primaryPort = $('#t' + data.table_id).find("table:first").find("tbody").find("tr:first").find("td:last-child");
    //var foreign_port = $('#t' + data.table_id).find("table:first").find("tbody").find("tr:first").find("td:first-child");

  // var $form = $("#main-form");
  // $form.on("submit", function(e){
  //   // debugger;
  //   e.preventDefault();
  //   var promise = $.post("/tables", $form.serialize());

  //   promise.done(function(response){
  //     $(".canvas").append(response);
  //     $form[0].reset();
  //   });
  // });

$(document).ready(function(){

  DOMinit = function(element){
    element = $(element);
    element.find(".draggable").draggable({
      stack: ".displayable-table",
      containment: "parent"
    });
    element.find(".sortable").sortable();
    element.find('.displayable-table').draggable({
      stop: onDragStop
    });
  };

  reloadCanvas = function(){
    var request = $.get(location.pathname)
    request.done(function(response){
      console.log(response);
      DOMinit( $('.canvas').html(response) );
    })
    request.error(function(){
      console.error('Failed to reload canvas');
    })
  };

  onDragStop = function(event){
    var element = $(this);
    var tableId = element.data('tableId');
    var y = parseInt(element.css('top'),10)  || 0;
    var x = parseInt(element.css('left'),10) || 0;
    var data = {
      table: {
        position_y: y,
        position_x: x,
      },
    };
    var request = $.ajax({
      method: 'put',
      url: '/tables/'+tableId,
      data: data,
    });
    request.fail(function(){
      debugger
    })

  }

  DOMinit(document.body);

  // canvas_refresh();
  // main toolbar form submits new table
  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      DOMinit( $(".canvas").append(response) );
      // $('#create-table-form').reset();
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
    });

  $("#hasone-relationships-form")
    .on('ajax:success', function(event, response, xhr){
      var response = response;
      var primary_port = $("")
    })
    .on('ajax:error', function(event) {
      console.error('failed to create relationship', arguments);
    })
  });




// var canvas_refresh = function() {
//   $("body").on("click", function() {
//     var projectId = $("body").data("projectId");
//       console.log("done");

//     var promise = $.get("/projects/" + projectId)
//     promise.done(function(partial) {
//       console.log(partial);
//       $(".canvas").replaceWith(partial);
//       $(".draggable").draggable();
//       $(".sortable").sortable();
//     })
//   });
// };
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

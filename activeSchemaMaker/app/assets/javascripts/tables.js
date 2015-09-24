$(document).ready(function(){

  $.repeat().add('connection').each($).connections('update').wait(0);


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
      DOMinit( $('#canvas').html(response) );
    })
    request.error(function(){
      console.error('Failed to reload canvas');
    })

    reloadProjectControl();
  };

  projectId = function(){
    return $('body').data('projectId');
  }

  reloadProjectControl = function(){
    var projectControlPartialUrl = '/projects/' + projectId() + '/project_control';
    var request = $.get(projectControlPartialUrl)
    request.done(function(response){
      DOMinit( $('#project_control').html(response) );
    })
    request.error(function(){
      console.error('Failed to reload project control');
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
      // debugger;
    })

  }

  DOMinit(document.body);

  // canvas_refresh();
  // main toolbar form submits new table
  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      reloadCanvas();
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
    });

  $("#hasone-relationships-form")
    .on('ajax:success', function(event, response, xhr){
      var response = response;
      console.log(response);
      var primary_port = $("")
    })
    .on('ajax:error', function(event) {
      console.error('failed to create relationship', arguments);
    })
  });


 var createKeyConnection = function(response){
      var primaryKey = "#pp" + response.table_id;
      var foreignKey = "#fp" + response.foreign_key_id;
      var selectorString = primaryKey + ", " + foreignKey;
      console.log(selectorString);
      $(selectorString).connections({'class':'fast'});
      //test below of non fk connections
      // var testString = '#pp4, #fp11';
      // $(testString).connections({'class':'fast'});
    };


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

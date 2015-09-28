$(document).ready(function(){

  // This keeps lines connected when divs are dragged
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

    $(document).on('click', '#create-table-form .btn-add-comments', function(event) {
    event.preventDefault();
    $('#create-table-form .comments-field').toggle()
    });

    $(document).on('click', 'a.btn-validations', function(event) {
      event.preventDefault();
      $(event.target).closest('h3').siblings('div').toggle();
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

  };

  reloadCanvas = function(){
    var request = $.get(location.pathname)
      request.done(function(response){
      DOMinit( $('#canvas').html(response) );
      drawAllConnections();
    })
    request.error(function(){
      console.error('Failed to reload canvas');
    })
    reloadProjectControl();
  };

  projectId = function(){
    return $('body').data('projectId');
  };

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
    });

  };

 function drawAllConnections(){
    console.log('Draw All');

    $('connection').remove();

    if(window.project){
      for(var i = 0; i < project.tables.length; i++){
        for(var j = 0; j < project.tables[i].relationships.length; j++){
          var relationship = project.tables[i].relationships[j];
          var selector = '#' + relationship.primary_port + ", #" + relationship.foreign_port;
          $(selector).connections({'class':'fast'});
        }
      }

    } else {
      console.log('no project data in page - check canvas partial');
    }
  }


  // DRAW ALL CONNECTIONS
  drawAllConnections();


  DOMinit(document.body);

  $(document)
  .on('ajax:success', '#create-table-form', function(event, response, xhr) {
    reloadCanvas();
  })
  .on("ajax:error", function(event){
    console.error('failed to create table', arguments);
  });

  $(document)
  .on('ajax:success',  "#hasone-relationships-form",function(event, response, xhr){
    reloadCanvas();
  })

  .on('ajax:error', function(event) {
    console.error('failed to create relationship', arguments);
  });





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

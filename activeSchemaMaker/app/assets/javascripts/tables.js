
$(document).ready(function(){

  $(".draggable").draggable();

  $(".sortable").sortable();

  // main toolbar form submits new table
  $('#create-table-form')
    .on('ajax:success', function(event, response, xhr) {
      $(".canvas").append(response);
      $(".draggable").draggable();
      $('#create-table-form').reset();
    })
    .on("ajax:error", function(event){
      console.error('failed to create table', arguments);
    });

  $("#hasone-relationships-form")
  .on('ajax:success', function(event, data, xhr){
    var response = data;
    console.log(response);
    debugger

    // $('t' + data.table_id,  ).

    // $("#fp" + data.table_id,"#pp()" + data.foreign_key_id).connections();
  })

  //tests

    $("body").on('click', function(){
      $("#t7").find("table:first").find("tbody").find("tr:first").find("td:last-child").append("<p>A</p>");
    });



});

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

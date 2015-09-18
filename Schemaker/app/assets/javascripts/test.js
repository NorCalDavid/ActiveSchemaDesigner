// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function helloWorld() {
var graph = new joint.dia.Graph;

    var paper = new joint.dia.Paper({
        el: $('#myholder'),
        width: 1000,
        height: 400,
        model: graph,
        gridSize: 1
    });

    var rect = new joint.shapes.basic.Rect({
        position: { x: 100, y: 30 },
        size: { width: 100, height: 60 },
        attrs: { rect: { fill: 'purple' }, text: { text: 'Nacho box', fill: 'white' } }
    });

    var rect2 = new joint.shapes.basic.Rect({
        position: { x: 100, y: 30 },
        size: { width: 100, height: 60 },
        attrs: { rect: { fill: 'purple' }, text: { text: 'Yo box', fill: 'white' } }
    });

    // var rect2 = rect.clone();
    rect2.translate(300);

    var rect3 = new joint.shapes.basic.Rect({
        position: { x: 200, y: 50 },
        size: { width: 100, height: 60 },
        attrs: { rect: { fill: 'purple' }, text: { text: 'Dat box', fill: 'white' } }
    });

    rect3.translate(150);


    var link = new joint.dia.Link({
        source: { id: rect.id },
        target: { id: rect2.id }
    });

    var link2 = new joint.dia.Link({
        source: { id: rect.id },
        target: { id: rect3.id }
    });

    var link3 = new joint.dia.Link({
        source: { id: rect2.id },
        target: { id: rect3.id }
    });

    graph.addCells([rect, rect2, rect3, link, link2, link3]);
};


var canvas = new fabric.Canvas('canvas');
var canvasElement = $("#canvas");

console.log(canvas.height);
console.log(canvas.width);

var shapeColor = 'red';

$(document).ready(function()
{
    var $colorPicker = $('#colorPicker');
    $colorPicker.tinycolorpicker();

    $colorPicker.bind("change", function(event, color)
    {
        shapeColor = color;
    });

});

function addSquare() {
    var rect = new fabric.Rect({
        top : random(canvas.height),
        left : random(canvas.width),
        width : 60,
        height : 60,
        fill : shapeColor
    });

    canvas.add(rect);
}

function addRectangle() {
    var rect = new fabric.Rect({
        top : random(canvas.height),
        left : random(canvas.width),
        width : 40,
        height : 80,
        fill : shapeColor
    });

    canvas.add(rect);
}

function addTriangle() {
    var tri = new fabric.Triangle({
        top: random(canvas.height),
        left: random(canvas.width),
        width: 200,
        height: 100,
        fill: shapeColor,
        stroke: 'blue',
        strokeWidth: 2
    });

    canvas.add(tri);
}

function addCircle() {
    var cir = new fabric.Circle({
        top: random(canvas.height),
        left: random(canvas.width),
        radius: 50,
        fill: shapeColor,
        stroke: shapeColor,
        strokeWidth: 2
    });

    canvas.add(cir);
}

function addEllipse() {
    var eli = new fabric.Ellipse({
        top: random(canvas.height),
        left: random(canvas.width),
        /* Try same values rx, ry => circle */
        rx: 75,
        ry: 50,
        fill: shapeColor,
        stroke: shapeColor,
        strokeWidth: 4
    });

    canvas.add(eli);
}

function addTrapezoid() {
    var trapezoid = [ {x:-100,y:-50},{x:100,y:-50},{x:150,y:50},{x:-150,y:50} ];
    var polyg = new fabric.Polygon(trapezoid, {
        top: random(canvas.height),
        left: random(canvas.width),
        fill: shapeColor,
        stroke: shapeColor,
        strokeWidth: 2
    });
    canvas.add(polyg);
}

function addStar() {
    var star = [ 	{x:350,y:75},
        {x:380,y:160},
        {x:470,y:160},
        {x:400,y:215},
        {x:423,y:301},
        {x:350,y:250},
        {x:277,y:301},
        {x:303,y:215},
        {x:231,y:161},
        {x:321,y:161},];
    var polyg = new fabric.Polygon(star, {
        top: random(canvas.height),
        left: random(canvas.width),
        fill: shapeColor,
        stroke: shapeColor,
        strokeWidth: 2
    });
    canvas.add(polyg);
}

function remove() {
    canvas.remove(canvas.getActiveObject());
}

function download() {
    var image = document.getElementById("canvas");
    window.location = image.toDataURL("image/png");
}

function random(max) {
    return Math.floor((Math.random() * max) + 1);
}


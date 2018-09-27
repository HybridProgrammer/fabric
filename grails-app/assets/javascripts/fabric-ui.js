var canvas = new fabric.Canvas('canvas');

var canvasElement = $("#canvas");

console.log(canvas.height);
console.log(canvas.width);

var shapeColor = 'red';
var pallet = [];
var palletShapes = [];

$(document).ready(function()
{
    $.cssHooks.backgroundColor = {
        get: function(elem) {
            if (elem.currentStyle)
                var bg = elem.currentStyle["backgroundColor"];
            else if (window.getComputedStyle)
                var bg = document.defaultView.getComputedStyle(elem,
                    null).getPropertyValue("background-color");
            if (bg.search("rgb") == -1)
                return bg;
            else {
                bg = bg.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
                function hex(x) {
                    return ("0" + parseInt(x).toString(16)).slice(-2);
                }
                return "#" + hex(bg[1]) + hex(bg[2]) + hex(bg[3]);
            }
        }
    };

    var shapeImage = new fabric.Rect({
        top : 15,
        left : 15,
        width : 70,
        height : 70,
        fill : shapeColor
    });
    addToPallet(shapeImage, 'canvasSquare');

    shapeImage =  new fabric.Rect({
        top : 25,
        left : 15,
        width : 70,
        height : 35,
        fill : shapeColor
    });
    addToPallet(shapeImage, 'canvasRectangle');

    shapeImage =  new fabric.Triangle({
        top: 15,
        left: 15,
        width: 75,
        height: 75,
        fill: shapeColor,
        strokeWidth: 2
    });
    addToPallet(shapeImage, 'canvasTriangle');

    var trapezoid = [ {x:-100,y:-50},{x:100,y:-50},{x:150,y:50},{x:-150,y:50} ];
    shapeImage = new fabric.Polygon(trapezoid, {
        top: 30,
        left: 5,
        fill: shapeColor,
        strokeWidth: 2
    });
    shapeImage.scaleX = 0.30;
    shapeImage.scaleY = 0.30;
    shapeImage.setCoords();
    addToPallet(shapeImage, 'canvasTrapezoid');

    shapeImage = new fabric.Circle({
        top: 15,
        left: 15,
        radius: 35,
        fill: shapeColor,
        strokeWidth: 2
    });
    addToPallet(shapeImage, 'canvasCircle');

    shapeImage = new fabric.Ellipse({
        top: 25,
        left: 15,
        /* Try same values rx, ry => circle */
        rx: 35,
        ry: 20,
        fill: shapeColor,
        strokeWidth: 4
    });
    addToPallet(shapeImage, 'canvasEllipse');

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
    var shapeImage = new fabric.Polygon(star, {
        top: 15,
        left: 15,
        fill: shapeColor,
        strokeWidth: 2
    });
    shapeImage.scaleX = 0.30;
    shapeImage.scaleY = 0.30;
    shapeImage.setCoords();
    addToPallet(shapeImage, 'canvasStar');

    var $colorPicker = $('#colorPicker');
    $colorPicker.tinycolorpicker();

    $colorPicker.bind("change", function(event, color)
    {
        shapeColor = color;
        palletShapes.forEach(function (value) {
            value.set('fill', color);
        });
        pallet.forEach(function (value) {
            value.renderAll();
        });
    });

});

function changeColor(el) {
    var color = $(el).css("backgroundColor");
    palletShapes.forEach(function (value) {
        value.set('fill', color);
    });
    pallet.forEach(function (value) {
        value.renderAll();
    });

}

function addToPallet(shapeImage, canvas) {
    var shape = new fabric.Canvas(canvas);
    shape.hoverCursor = 'pointer';
    pallet.push(shape);

    shapeImage.set('selectable', false);
    palletShapes.push(shapeImage);

    shape.add(shapeImage);
}

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
        width : 80,
        height : 40,
        fill : shapeColor
    });

    canvas.add(rect);
}

function addTriangle() {
    var tri = new fabric.Triangle({
        top: random(canvas.height),
        left: random(canvas.width),
        width: 100,
        height: 100,
        fill: shapeColor,
        strokeWidth: 2
    });
    tri.scaleX = 0.70;
    tri.scaleY = 0.70;
    tri.setCoords();

    canvas.add(tri);
}

function addCircle() {
    var cir = new fabric.Circle({
        top: random(canvas.height),
        left: random(canvas.width),
        radius: 50,
        fill: shapeColor,
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
        strokeWidth: 2
    });
    polyg.scaleX = 0.50;
    polyg.scaleY = 0.50;
    polyg.setCoords();
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

    polyg.scaleX = 0.50;
    polyg.scaleY = 0.50;
    polyg.setCoords();

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
    max = max - 90;
    return Math.floor((Math.random() * max) + 1);
}


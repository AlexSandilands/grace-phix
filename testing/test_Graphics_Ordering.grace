// Test that demonstrates key presses, mouse events, interacting
// with objects that have been drawn and changing the draw order of objects

// Click on a circle and drag it around

// Pressing delete toggles deleting a circle on click

// Pressing 1 - 8 toggles different order changing when clicking on objects
// 1 : Do nothing
// 2 : Send to back
// 3 : Bring to front
// 4 : Send back one position
// 5 : Bring forward one position

import "graphics" as g

import "Color" as col
import "GMath" as math

def window = g.createWindow
def canvas = g.createCanvas
window.add(canvas)

def d1 = g.createCircleAround(200, 200) radius(30) colored(col.magenta)
def d2 = g.createCircleAround(250, 200) radius(30) colored(col.pink)
def d3 = g.createCircleAround(250, 250) radius(30) colored(col.doge)
def d4 = g.createCircleAround(200, 250) radius(30) colored(col.red)
def d5 = g.createCircleAround(200, 300) radius(30) colored(col.blue)
def d6 = g.createCircleAround(250, 300) radius(30) colored(col.green)

canvas.addAll([d1, d2, d3, d4, d5, d6])

var prev_x := 0
var prev_y := 0
var ind := 0
var del := false

var click : Block := {}

window.onKey("1") do { click := {} }

window.onKey("2") do {

    click := { i ->

        canvas.sendIndexToBack(i)
        ind := 1
    }
}

window.onKey("3") do {

    click := { i ->

        canvas.bringIndexToFront(i)
        ind := 6
    }
}

window.onKey("4") do {

    click := { i ->

        canvas.sendIndexBack(i)

        if (ind > 1) then {

            ind := ind - 1
        }
    }
}

window.onKey("5") do {

    click := { i ->

        canvas.bringIndexForward(i)

        if (ind < 6) then {

            ind := ind + 1
        }
    }
}

canvas.mousePressed := { at ->

    prev_x := at.x
    prev_y := at.y
    ind := canvas.findDrawableAt(at.x, at.y)

    if (ind != 0) then {

        click.apply(ind)
        canvas.paint
    }
}

canvas.mouseDragged := { at ->

    if(ind != 0) then {

        canvas.getWithIndex(ind).moveBy(at.x - prev_x, at.y - prev_y)
        canvas.paint
    }

    prev_x := at.x
    prev_y := at.y
}

window.display
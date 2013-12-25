import "graphics" as g

import "Color" as col
import "Math" as math

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


window.onKey("delete") do {

    if (del) then {

        del := false

    } else {

        del := true
    }
}

canvas.mousePressed := { at ->

    prev_x := at.x
    prev_y := at.y
    ind := canvas.findDrawableAt(at.x, at.y)

    if (del) then {

        canvas.removeWithIndex(ind)
        canvas.paint
    }
}

canvas.mouseDragged := { at ->

    if (!del) then {

        if(ind != 0) then {

            canvas.getWithIndex(ind).moveBy(at.x - prev_x, at.y - prev_y)
            canvas.paint
        }

        prev_x := at.x
        prev_y := at.y
    }
}

window.display
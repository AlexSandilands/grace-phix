import "graphics" as g

import "Color" as col
import "Math" as math

def window = g.createWindow
def canvas = g.createCanvas

def circle1 = g.createCircleAround(200, 200) radius(30) colored(col.magenta)
def circle2 = g.createCircleAround(250, 200) radius(30) colored(col.pink)
def circle3 = g.createCircleAround(250, 250) radius(30) colored(col.doge)
def circle4 = g.createCircleAround(200, 250) radius(30) colored(col.red)
def circle5 = g.createCircleAround(200, 300) radius(30) colored(col.blue)
def circle6 = g.createCircleAround(250, 300) radius(30) colored(col.green)

canvas.add(circle1)
canvas.add(circle2)
canvas.add(circle3)
canvas.add(circle4)
canvas.add(circle5)
canvas.add(circle6)

window.add(canvas)

var prev_x := 0
var prev_y := 0
var ind := 0

canvas.mousePressed := { at ->

    prev_x := at.x
    prev_y := at.y
    ind := canvas.checkDrawableAt(at.x, at.y)
}

canvas.mouseDragged := { at ->

    if(ind != 0) then {

        canvas.drawables[ind].moveBy(at.x - prev_x, at.y - prev_y)
        canvas.paint
    }

    prev_x := at.x
    prev_y := at.y
}

window.display
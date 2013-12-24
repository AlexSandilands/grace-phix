import "graphics" as g

import "Color" as col
import "Math" as math

def window = g.createWindow
def canvas = g.createCanvas
window.add(canvas)

canvas.color := col.magenta
canvas.drawCircleAround(200, 200) radius(30)
canvas.color := col.pink
canvas.drawCircleAround(250, 200) radius(30)
canvas.color := col.doge
canvas.drawCircleAround(250, 250) radius(30)
canvas.color := col.red
canvas.drawCircleAround(200, 250) radius(30)
canvas.color := col.blue
canvas.drawCircleAround(200, 300) radius(30)
canvas.color := col.green
canvas.drawCircleAround(250, 300) radius(30)

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
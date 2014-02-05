import "graphics" as g
import "Color" as col

def window = g.createWindow
def canvas = g.createCanvas

window.add(canvas)

canvas.color := col.doge
def r = canvas.drawRectangleAt(200, 200) sized(250, 70)

var right := true

def t = g.every(5) do {

    if (right) then {

        r.x := r.x + 2
        canvas.paint

        if ((r.x + r.width) > 640) then {

            right := false
        }

    } else {

        r.x := r.x - 2
        canvas.paint

        if (r.x < 0) then {

            right := true
        }
    }
}

window.display
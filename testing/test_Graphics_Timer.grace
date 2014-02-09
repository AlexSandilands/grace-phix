import "graphics" as g
import "Color" as col

def window = g.createWindow
def canvas = g.createCanvas
def up = g.createButtonCalled("Up after 1 second")
def down = g.createButtonCalled("Down after 1 second")
def start = g.createButtonCalled("Start")
def stop = g.createButtonCalled("Stop")

def hbox = g.createHorizontalBox
hbox.addAll([start, stop, up, down])

window.add(canvas)
window.add(hbox)

canvas.color := col.doge

def r = canvas.drawRectangleAt(200, 200) sized(250, 70)

var animating := false
var right := true

start.clicked := {

    if (!animating) then {

        animating := true


        g.every(5) do {

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
    }
}

stop.clicked := {

    if (animating) then {

        animating := false

        g.stopAll
    }
}

up.clicked := {

    g.after(1000) do {

        r.y := r.y - 20
        canvas.paint
    }
}

down.clicked := {

    g.after(1000) do {

        r.y := r.y + 20
        canvas.paint
    }
}





window.display
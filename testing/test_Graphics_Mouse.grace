import "graphics" as g

import "Math" as math
import "Color" as col

def window = g.createWindow
def canvas = g.createCanvas

def colorButton = g.createButtonCalled("Change Color")
colorButton.setSize(50, 50)

var size := 5
def sizeUp = g.createButtonCalled("+")
def sizeDown = g.createButtonCalled("-")

def hBox = g.createHorizontalBoxContaining([colorButton, sizeUp, sizeDown])

window.addAll([canvas, hBox])

canvas.mouseReleased := { at ->

    canvas.drawCircleAround(at.x, at.y) radius(size)
    canvas.paint
}

canvas.mouseDragged := { at ->

    canvas.drawCircleAround(at.x, at.y) radius(size)
    canvas.paint
}

var colors := [col.black, col.red, col.blue, col.green, col.pink, col.doge]
var currentColor := 1

colorButton.clicked := {

    if (currentColor == 6) then {

        currentColor := 1
        canvas.color := colors[currentColor]

    } else {

        currentColor := currentColor + 1
        canvas.color := colors[currentColor]
    }


}

sizeUp.clicked := {

    size := size * 2
}

sizeDown.clicked := {

    size := size / 2
}

window.display
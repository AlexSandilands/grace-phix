// This is a test that isolated a memory error on line 27

import "graphics" as g
import "Color" as col
import "Math" as math

def window = g.createWindow

def canvas = g.createCanvas

window.add(canvas)

def rect = g.createRectangle
rect.width := 200
rect.height := 200

def circ = g.createCircle
circ.color := col.blue

def text = g.createText
text.color := col.red

canvas.addAll([rect, circ, text])

// var a := (3*math.pi)/2

canvas.drawLineAt(100, 350) length(50) angle(math.pi)

def button = g.createButton
button.label := "Hello World"

button.clicked := {

    text.text := "Hello World"
    canvas.paint
}

window.add(button)

window.display
import "graphics" as g
import "Color" as col

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

canvas.add(rect)
canvas.add(circ)
canvas.add(text)

def button = g.createButton
button.label := "Hello Word"

button.clicked := {

    text.text := "Hello World"
    canvas.paint
}

window.add(button)

window.display
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

canvas.add(rect)
canvas.add(circ)
canvas.add(text)

canvas.fill := false
canvas.color := col.pink
canvas.drawRectangleAt(200, 200) sized(25, 25)
canvas.color := col.red
canvas.drawCircleAround(20, 20) radius(20)
canvas.color := col.doge
canvas.drawSectorAround(300, 50) from(0) to(math.pi) radius(40)
canvas.color := col.blue
canvas.drawArcAround(100, 100) from(0) to(math.two_pi) radius(30) width(10)
canvas.fill := true
canvas.color := col.orange
canvas.drawOvalAt(280, 150) sized(100, 50)
canvas.color := col.blue
canvas.drawLineFrom(20, 250) to(400, 260)
canvas.color := col.green
canvas.drawTextSaying("Hello World") at(100, 200)
canvas.drawImageAt(20, 280) sized(200, 200) from("doge.png")


def button = g.createButton
button.label := "Hello World"

button.clicked := {

    text.text := "Hello World"
    canvas.paint
}

window.add(button)

window.display
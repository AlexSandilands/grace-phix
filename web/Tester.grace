import "Canvas" as canvas
import "Color"   as col
import "Drawable" as drawable
import "Vector2" as vec2
import "Window" as win

//create a new window
var w :=  win.aWindow.new("test", vec2.x(640) y(480), vec2.x(100) y(100))

//create a new canvas and add to the window
var c := canvas.aCanvas.new(vec2.x(640) y(480), vec2.x(0) y(0), "00ff00")
w.addComponent(c)

//creates a new drawable and adds it to the canvas
var d1 := drawable.aRectangle.at(vec2.x(10) y(10)) sized(vec2.x(200) y(200)) colored(col.red)
c.addDrawable(d1)
var d2 := drawable.aCircle.around(vec2.x(200) y(400)) radius(100) colored(col.blue)
c.addDrawable(d2)

//create the main loop and add to the window
var counter := 0
w.setMainLoop({

    if (counter > 500) then {

        w.running := false
    }

    counter := counter + 1
    d1.moveBy(1, 0)
    d2.moveBy(0, -2)
})

//start the main loop
w.display
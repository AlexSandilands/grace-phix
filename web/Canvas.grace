import "Component" as comp
import "dom" as dom
import "Drawable" as drawable
import "Vector2" as vec2

//CANVAS TYPE
type Canvas = comp.Component & {

    //the size of the canvas
    size -> vec2.Vector2
    //the position of the canvas in the parent component
    position -> vec2.Vector2
    //the clear colour of the canvas
    color -> String

    //METHODS
    // Initiliase the canvas
    // NOTE: this should only be called by the window
    init -> Done
    //redisplays the canvas
    // NOTE: this should only be called by the window
    display -> Done
    // Adds a drawable to the canvas
    addDrawable(d : drawable.Drawable) -> Done
}

//CANVAS CLASS
//Creates a new canvas
class aCanvas.new(size' : vec2.Vector2,
    position' : vec2.Vector2, color' : String) -> Canvas {

    //initialise the variables
    var size := size'
    var position := position'
    var color := color'

    //the dom canvas
    var canvas
    //the dom graphics context
    var context

    //the drawables on the canvas
    var drawables := []

    //METHODS
    // Initiliase the canvas
    // NOTE: this should only be called by the window
    method init(window) -> Done {

        //create the canvas and graphics context
        canvas := window.document.createElement("canvas")
        window.document.body.appendChild(canvas)
        canvas.width := size.x
        canvas.height := size.y
        context := canvas.getContext("2d")
        context.lineWidth := 1

        context.fillStyle := color
        context.fillRect(position.x, position.y, size.x, size.y)
    }

    // Redisplays the canvas
    // NOTE: this should only be called by the window
    method display -> Done {

        //redraw the background
        context.fillStyle := color
        context.fillRect(position.x, position.y, size.x, size.y)

        //iterate over the drawables and draw them
        for (drawables) do { d ->

            d.draw(context)
        }
    }

    // Adds a drawable to the canvas
    method addDrawable(d : drawable.Drawable) -> Done {

        drawables.push(d)
    }
}
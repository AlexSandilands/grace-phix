import "Component" as comp
import "dom" as dom
import "Drawable" as drawable
import "Vector2" as vec2

//Canvas Type
type Canvas = comp.Component & {

    //VARIABLES
    //the dimensions of the canvas
    dim -> vec2.Vector2
    //the clear colour of the canvas
    color -> String
    //the drawable elements on the canvas
    drawables -> drawable.Drawable

    //METHODS
    //redispays the canvas
    display -> Done
    //adds a drawable to the canvas
    addDrawable(d : drawable.Drawable) -> Done
}

//Canvas Class
//dim': the dimensions of the canvas
//color': the clear color of the canvas
class aCanvas.new(dim' : vec2.Vector2, color' : String) -> Canvas {

    //VARIABLES
    var dim := dim'
    var color := color'

    //is true once the canvas has been initialised
    var initialised := false

    //the list of drawables
    var drawables

    //dom stuff
    var document
    var canvas
    var context

    //PUBLIC METHODS
    //displays the canvas
    method display -> Done {

        //if the canvas hasn't been initialised do it
        if (!initialised) then {

            init
        }

        //re-fill the canvas
        context.fillStyle := color
        context.fillRect(0, 0, dim.x, dim.y)

        //render the drawables
        drawables.draw(context)
    }

    //adds a drawable to the canvas
    method addDrawable(d : drawable.Drawable) -> Done {

        drawables := d
    }

    //CONFIDENTIAL METHODS
    //initialises the canvas
    method init  -> Done is confidential {

        document := dom.document

        def ts = document.getElementById("output-select")
        for (0..(ts.options.length-1)) do {i->
            if (ts.options.item(i).value == "canvas") then {
                ts.selectedIndex := i
                dom.window.outputswitch
            }
        }
        canvas := document.getElementById("standard-canvas")
        context := canvas.getContext("2d")
        context.lineWidth := 1
    }

}
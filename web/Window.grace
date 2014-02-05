import "Canvas" as canvas
import "Component" as comp
import "dom" as dom
import "Vector2" as vec2

//WINDOW TYPE
type Window = comp.Component & {

    //begins the main loop and displays the window
    display -> Done

    //the title of the window
    title -> String
    title := (t : String) -> Done

    //the dimensions of the window
    size -> vec2.Vector2
    size := (s : vec2.Vector2) -> Done

    //the position of the window
    position -> vec2.Vector2
    position := (p : vec2.Vector2) -> Done

    //returns the window as a string
    asString -> String
}

//WINDOW CLASS
class aWindow.new(title' : String, size' : vec2.Vector2, pos' : vec2.Vector2) {

    //initialise variables
    var title := title'
    var size := size'
    var pos := pos'

    //create the dom window //TODO: position
    var sx := size.x + 10
    var w := dom.window.open("", title,"location=no,status=no,width=" ++ sx ++ ",height=" ++ (size.y + 10))

    //the components of the window
    var components := []

    //is true while the window is running
    var running is public := true
    //the main loop of the window
    var mainLoop
    //returns the main loop
    method getMainLoop -> Block {

        mainLoop
    }
    //sets the mainLoop
    method setMainLoop(ml : Block) -> Done {

        mainLoop := ml
    }

    // Displays the window
    method display -> Done {

        //wait 5ms between each iteration of the loop
        dom.while {running} waiting 5 do {

            mainLoop.apply

            //display the components
            for (components) do { c ->

                match (c)
                    case { can : canvas.Canvas -> can.display }
            }
        }
    }

    // Adds a component to the window
    method addComponent (c : comp.Component) -> Boolean {

        //check the component type before adding
        match (c)
            //if the component is a canvas we need to initilaise it
            case { can : canvas.Canvas -> can.init(w) }
            case { _ -> print "not a canvas" }

        components.push(c)
    }
}
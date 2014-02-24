import "canvas" as can
import "components" as comps
import "dom" as dom
import "mgcollections" as collections
import "Vector2" as vec2

// Window component.
// This component is a top level graphical frame, which is required
// for anything that needs to be displayed. It is also of type container
// as it can contain other components which get displayed in the window.
// Whenever you add a new component to the window it gets displayed at the
// bottom, as the window uses a vertical box. You can add other boxes
// to the window if you want components to be displayed in different directions
// and orders
type Window = comps.Container & {

    display -> Done

    title -> String
    title:= (t : String) -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    width -> Number
    width:= (w' : Number) -> Done

    height -> Number
    height:= (h' : Number) -> Done

    position -> vec2.Vector2
    position:= (p : vec2.Vector2) -> Done

    mousePressed:=  (b : Block) -> Done
    mouseReleased:= (b : Block) -> Done
    mouseDragged:=  (b : Block) -> Done

    onKey(key : String) do(b : Block) -> Done

    asString -> String
}


// Wrapper class for a gtk window. Has more readable syntax
class aWindow.new() -> Window {

    //is true while the window is running
    var running is public := true

    // Size of this window
    var s : vec2.Vector2 is confidential := vec2.x(640) y(480)

    //TODO: make nicer
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

    // dom components and values

    // The dom window object
    def w  = dom.window.open("", "Default Window",
        "location=no,status=no,width=" ++ s.x ++ ",height=" ++ s.y)

    // The default box for components to be added to.
    def box : comps.Container = comps.aVerticalBox.new

    //w.add(box.getComponent)
    box.parent := self

    // COMPONENT METHODS

    def ComponentError = Error.refine "Component Error"

    // Window throws an error when trying to get it's parent
    method parent -> comps.Component is override {

        ComponentError.raise "Windows do not have a parent component"
    }

    // Window throws an error when trying to set it's parent
    method parent := (c : comps.Component) -> Done is override {

        ComponentError.raise "Windows do not have a parent component"
    }

    // Updates the window
    // NOTE: this should never be manually called
    method update -> Done {

        // update the box
        box.update
    }

    // CONTAINER METHODS

    method add(c : comps.Component) -> Boolean {

        //we need to initialise the component if it's a canvas
        match (c)
            //if the component is a canvas we need to initilaise it
            case { canvas : can.Canvas -> canvas.init(w) }

        box.add(c)
    }

    method addAll(l : List<Component>) -> Boolean {

        box.addAll(l)
    }

    method remove(c : comps.Component) -> Boolean {

        box.remove(c)
    }

    method children -> List<comps.Component> {

        [box]
    }




    // WINDOW METHODS

    // Displays the window and all components in the window
    // then starts up the gtk main loop.
    // ALWAYS PUT THIS AT THE END OF YOUR CODE
    method display -> Done {

        box.update
    }

    // Return the title of this window
    method title -> String {

        w.title
    }

    // Set the title of this window
    method title:= (t : String) -> Done {

        w.title := t
    }

    // Return the size of this window
    // First component is width, second is height
    method size -> vec2.Vector2 {

        s
    }

    // Set the size of this window with a vector
    // First component is width, second is height
    method size := (s' : vec2.Vector2) -> Done {

        s := s'
        w.innerWidth := s.x
        w.innerHeight := s.y
    }

    // Returns the width of this window
    method width -> Number {

        s.x
    }

    // Set the width of this window
    method width := (w' : Number) -> Done {

        s.x := w'
        w.innerWidth := s.x
    }

    // Returns the height of this window
    method height -> Number {

        s.y
    }

    // Set the height of this window
    method height := (h' : Number) -> Done {

        s.y := h'
        w.innerHeight := s.y
    }

    // Return the position of this window
    // First component is width, second is height
    method position -> vec2.Vector2 {

        // TODO
    }

    // Set the position of this window with a Vector
    // First component is width, second is height
    method position:= (p : vec2.Vector2) -> Done {

        // TODO
    }


    // MOUSE EVENTS

    var pressedBlock  : Block := {}
    var releasedBlock : Block := {}
    var draggedBlock  : Block := {}

    // Set the pressed block
    method mousePressed := (b : Block) -> Done {

        //add the update to the end of the block
        def pressedBlock = { ev->

            def e = object {

                var x is public := ev.clientX
                var y is public := ev.clientY
            }

            b.apply(e)
            update
        }

        //add to the dom canvas
        w.addEventListener("click", pressedBlock)
    }

    // Set the relesaed block
    method mouseReleased := (b : Block) -> Done {

        //add the update to the end of the block
        def releasedBlock = { ev->

            def e = object {

                var x is public := ev.clientX
                var y is public := ev.clientY
            }

            b.apply(e)
            update
        }

        //add to the dom canvas
        w.addEventListener("mouseup", releasedBlock)
    }

    // Set the dragged block
    method mouseDragged := (b : Block) -> Done {

        //add the update to the end of the block
        def dragBlock = { ev->

            def e = object {

                var x is public := ev.clientX
                var y is public := ev.clientY
            }

            b.apply(e)
            update
        }

        //add to the dom canvas
        w.addEventListener("mousemove", dragBlock)
    }


    // KEY EVENTS

    // Don't mind me, just making a dirty big map since grace has no characters
    def charCodeMap = collections.map.new
    charCodeMap.put(32, " ")
    charCodeMap.put(33, "!")
    charCodeMap.put(34, "\"")
    charCodeMap.put(35, "#")
    charCodeMap.put(36, "$")
    charCodeMap.put(37, "%")
    charCodeMap.put(38, "&")
    charCodeMap.put(39, "\'")
    charCodeMap.put(40, "(")
    charCodeMap.put(41, ")")
    charCodeMap.put(42, "*")
    charCodeMap.put(43, "+")
    charCodeMap.put(44, ",")
    charCodeMap.put(45, "-")
    charCodeMap.put(46, ".")
    charCodeMap.put(47, "/")
    charCodeMap.put(48, "0")
    charCodeMap.put(49, "1")
    charCodeMap.put(50, "2")
    charCodeMap.put(51, "3")
    charCodeMap.put(52, "4")
    charCodeMap.put(53, "5")
    charCodeMap.put(54, "6")
    charCodeMap.put(55, "7")
    charCodeMap.put(56, "8")
    charCodeMap.put(57, "9")
    charCodeMap.put(58, ":")
    charCodeMap.put(59, ";")
    charCodeMap.put(60, "<")
    charCodeMap.put(61, "=")
    charCodeMap.put(62, ">")
    charCodeMap.put(63, "?")
    charCodeMap.put(64, "@")
    charCodeMap.put(65, "A")
    charCodeMap.put(66, "B")
    charCodeMap.put(67, "C")
    charCodeMap.put(68, "D")
    charCodeMap.put(69, "E")
    charCodeMap.put(70, "F")
    charCodeMap.put(71, "G")
    charCodeMap.put(72, "H")
    charCodeMap.put(73, "I")
    charCodeMap.put(74, "J")
    charCodeMap.put(75, "K")
    charCodeMap.put(76, "L")
    charCodeMap.put(77, "M")
    charCodeMap.put(78, "N")
    charCodeMap.put(79, "O")
    charCodeMap.put(80, "P")
    charCodeMap.put(81, "Q")
    charCodeMap.put(82, "R")
    charCodeMap.put(83, "S")
    charCodeMap.put(84, "T")
    charCodeMap.put(85, "U")
    charCodeMap.put(86, "V")
    charCodeMap.put(87, "W")
    charCodeMap.put(88, "X")
    charCodeMap.put(89, "Y")
    charCodeMap.put(90, "Z")
    charCodeMap.put(91, "[")
    charCodeMap.put(92, "\\")
    charCodeMap.put(93, "]")
    charCodeMap.put(94, "^")
    charCodeMap.put(95, "_")
    charCodeMap.put(96, "`")
    charCodeMap.put(97, "a")
    charCodeMap.put(98, "b")
    charCodeMap.put(99, "c")
    charCodeMap.put(100, "d")
    charCodeMap.put(101, "e")
    charCodeMap.put(102, "f")
    charCodeMap.put(103, "g")
    charCodeMap.put(104, "h")
    charCodeMap.put(105, "i")
    charCodeMap.put(106, "j")
    charCodeMap.put(107, "k")
    charCodeMap.put(108, "l")
    charCodeMap.put(109, "m")
    charCodeMap.put(110, "n")
    charCodeMap.put(111, "o")
    charCodeMap.put(112, "p")
    charCodeMap.put(113, "q")
    charCodeMap.put(114, "r")
    charCodeMap.put(115, "s")
    charCodeMap.put(116, "t")
    charCodeMap.put(117, "u")
    charCodeMap.put(118, "v")
    charCodeMap.put(119, "w")
    charCodeMap.put(120, "x")
    charCodeMap.put(121, "y")
    charCodeMap.put(122, "z")
    charCodeMap.put(113, "\{") //TODO: fix me
    charCodeMap.put(114, "|")
    charCodeMap.put(115, "\}")
    charCodeMap.put(116, "~")

    // A Map from key events to the blocks
    def keyMap = collections.map.new

    // Allow the user to enter a string representation of a key and a block
    // which will execute when that key is pressed
    method onKey(key : String) do(b : Block) -> Done {

        // add the key and the block to the map
        keyMap.put(key, b)

        // create the key board
        def keyBlock = { ev ->

            //print(ev.charCode)

            //print(charCodeMap.get(ev.charCode))

            // execute the correct block
            keyMap.get(charCodeMap.get(ev.charCode)).apply
        }

        w.addEventListener("keypress", keyBlock)
    }




    // Returns the name of this window as a string
    method asString -> String {

        "Window: {w.title}, Dim: {s}"
    }
}
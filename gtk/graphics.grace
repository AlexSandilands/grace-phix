// GTK Imports
import "gtk" as gtk
import "gdk" as gdk

// Utils imports
import "Vector2" as vec2
import "Color" as col
import "Math" as math

// Graphics imports
import "window" as win
import "canvas" as can
import "components" as comps
import "drawable" as draw



// ---------------------------------- //
//                                    //
//           WINDOW METHODS           //
//                                    //
// ---------------------------------- //


// Default window, sized 640x480
method createWindow -> win.Window {

    return win.aWindow.new
}

// Creates and returns a default window at the position passed in
method createWindowAt(x : Number, y : Number) -> win.Window {

    var ret := win.aWindow.new
    ret.position := vec2.setCoord(x, y)

    return ret
}

// Creates and returns a window at the specified position with the
// specified size
method createWindowAt(x : Number, y : Number)
             withSize(w : Number, h : Number) -> win.Window {

    var ret := win.aWindow.new
    ret.position := vec2.setCoord(x, y)
    ret.size := vec2.setCoord(w, h)

    return ret
}

// Creates and returns a window with the specified size
method createWindowWithSize(w : Number, h : Number) -> win.Window {

    var ret := win.aWindow.new
    ret.size := vec2.setCoord(w, h)

    return ret
}

// Creates a window with name, position and size specified
method createWindowCalled(t : String)
                       at(x : Number, y : Number)
                 withSize(w : Number, h : Number) -> win.Window{

    var ret := win.aWindow.new
    ret.title := t
    ret.position := vec2.setCoord(x, y)
    ret.size := vec2.setCoord(w, h)

    return ret
}


// ============================================================================
// ============================================================================


// ---------------------------------- //
//                                    //
//           CANVAS METHODS           //
//                                    //
// ---------------------------------- //

// Default canvas sized 640x480
method createCanvas -> can.Canvas {

    can.aCanvas.new
}

// Canvas sized wxh
method createCanvasWithSize(w : Number, h : Number) -> can.Canvas {

    var ret := can.aCanvas.new
    ret.size := vec2.setCoord(w, h)

    return ret
}


// ============================================================================
// ============================================================================


// ---------------------------------- //
//                                    //
//         COMPONENT METHODS          //
//                                    //
// ---------------------------------- //


// BOXES

method createVerticalBox -> comps.Container {

    comps.aVerticalBox.new
}

// A vertical box containing the list of components l
method createVerticalBoxContaining(l : List<comps.Component>) -> comps.Container {

    var ret := comps.aVerticalBox.new

    for (l) do { c ->

        ret.add(c)
    }

    return ret
}

method createHorizontalBox -> comps.Container {

    comps.aHorizontalBox.new
}

// A horizontal box containing the list of components l
method createHorizontalBoxContaining(l : List<comps.Component>) -> comps.Container {

    var ret := comps.aHorizontalBox.new

    for (l) do { c ->

        ret.add(c)
    }

    return ret
}


// BUTTONS

// Default button, no label, no actions
method createButton -> comps.Button {

    comps.aButton.new
}

// Button with a label
method createButtonCalled(s : String) -> comps.Button {

    var ret := comps.aButton.new
    ret.label := s

    return ret
}

// Button with a label and an action on clicked
method createButtonCalled(s : String) onClicked(b : Block) {

    var ret := comps.aButton.new
    ret.label := s
    ret.clicked := b

    return ret
}


// ============================================================================
// ============================================================================


// ---------------------------------- //
//                                    //
//         DRAWABLE METHODS           //
//                                    //
// ---------------------------------- //


// RECTANGLES


// Rectangle. Has default values: Black, at (25, 25), sized 50x50
method createRectangle -> draw.Rectangle {

    return draw.aRectangle.at (vec2.setCoord(25, 25))
                        sized (vec2.setCoord(50, 50))
                      colored (col.black)
}

// Rectangle at (x, y) sized wxh colored c
method createRectangleAt(x : Number, y : Number)
                   sized(w : Number, h : Number)
                 colored(c : col.Color) -> draw.Rectangle {

    draw.aRectangle.at(vec2.setCoord(x, y)) sized(vec2.setCoord(w, h)) colored(c)
}


// CIRCLES


// Circle. Has default values: Black, around (50, 50), radius 25
method createCircle -> draw.Circle {

    return draw.aCircle.around (vec2.setCoord(50, 50))
                        radius (25)
                       colored (col.black)
}

// Circle around (x, y) radius r colored c
method createCircleAround(x : Number, y : Number)
                   radius(r : Number)
                  colored(c : col.Color) -> draw.Circle {

    draw.aCircle.around(vec2.setCoord(x, y)) radius(r) colored(c)
}


// OVALS


// Oval. Has default values: Black, around (50, 50) width 50 height 25
method createOval -> draw.Oval {

  return draw.aOval.at (vec2.setCoord(50, 50))
                 sized (vec2.setCoord(50, 25))
               colored (col.black)
}

// Oval around (x, y) size wxh colored c
method createOvalAt(x : Number, y : Number)
              sized(w : Number, h : Number)
            colored(c : Color) -> draw.Oval {

    return draw.aOval.at (vec2.setCoord(x, y))
                   sized (vec2.setCoord(w, h))
                 colored (col.black)
}

// SECTORS


// Sector. Has default values: Black, around (50, 50), radius 25, from 0 to pi
method createSector -> draw.Sector {

    return draw.aSector.around (vec2.setCoord(50, 50))
                          from (0) to (math.pi)
                        radius (25)
                       colored (col.black)
}

// Sector around (x, y) radius r from f to t colored c
method createSectorAround(x : Number, y : Number)
                     from(f : Number)
                       to(t : Number)
                   radius(r : Number)
                  colored(c : col.Color) -> draw.Sector {

    draw.aSector.around(vec2.setCoord(x, y)) from(f) to(t) radius(r) colored(c)
}


// ARCS


// Arc. Has default values: Black, around (50, 50), radius 25, width 10 from 0 to 2pi
method createArc -> draw.Arc {

    return draw.aArc.around (vec2.setCoord(50, 50))
                       from (0) to (math.two_pi)
                     radius (25)
                      width (10)
                    colored (col.black)
}

// Arc around (x, y) radius r width w from f to t colored c
method createArcAround(x : Number, y : Number)
                  from(f : Number)
                    to(t : Number)
                radius(r : Number)
                 width(w : Number)
               colored(c : col.Color) -> draw.Arc {

    draw.aArc.around(vec2.setCoord(x, y)) from(f) to(t) radius(r) width(w) colored(c)
}


// LINE

// Line. Has default values: Black, from (25, 25) to (75, 75)
method createLine -> draw.Line {

    return draw.aLine.from (vec2.setCoord(25, 25))
                        to (vec2.setCoord(75, 75))
                   colored (col.black)
}

// Line from (x1, y1) to (x2, y2) colored b
method createLineFrom(x1 : Number, y1 : Number)
                   to(x2 : Number, y2 : Number)
              colored(c : col.Color) -> draw.Line {

    return draw.aLine.from (vec2.setCoord(x1, y1))
                        to (vec2.setCoord(x2, y2))
                   colored (c)
}


// TEXT

// Text. Has default values: Black, at (45, 48) saying "Text"
method createText -> draw.Text {

    return draw.aText.write ("Text")
                         at (vec2.setCoord(39, 52))
                    colored (col.black)
}

// Text saying t at (x, y) colored c
method createTextSaying(t : String)
                     at(x : Number, y : Number)
                colored(c : col.Color) -> draw.Text {

    draw.aText.write(t) at(vec2.setCoord(x, y)) colored(c)
}


// IMAGE

// Image at (x, y) sized wxh from file: path
method createImageAt(x : Number, y : Number)
               sized(w : Number, h : Number)
                from(path : String) -> draw.Image {

    draw.aImage.at(vec2.setCoord(x, y)) sized(w, h) from(path)
}
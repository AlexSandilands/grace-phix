import "dom" as dom

import "io" as io
import "sys" as sys

import "Vector2" as vec2
import "Color"   as col
import "GMath"    as math


// Abstract super class for drawable objects
type Drawable = {

    location -> vec2.Vector2
    visible -> Boolean

    x -> Number
    y -> Number

    x := (x' : Number) -> Done
    y := (y' : Number) -> Done

    //moveTo := (l : vec2.Vector2) -> Done
    //moveBy(dx : Number, dy : Number) -> Done

    // Takes a graphics object to draw with
    draw(gfx) -> Done

    // Checks if (x, y) is inside the drawable
    contains(x : Number, y : Number) -> Boolean

    clone -> Drawable
}


// Drawable rectangle type
type Rectangle = Drawable & {

    size  -> vec2.Vector2
    color -> col.Color

    fill  -> Boolean
    lineWidth -> Number

    width -> Number
    width := (w' : Number) -> Done

    height -> Number
    height := (h' : Number) -> Done
}


// Drawable circle type
// This is a sector, but the "from" and "to" values are constants: 0 -> 2pi
type Circle = Drawable & {

    radius -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number
}


// Drawable oval type
// This is a circle but it doesn't have a constant radius
type oval = Drawable & {

    size -> vec2.Vector2

    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number

    width -> Number
    width := (w' : Number) -> Done

    height -> Number
    height := (h' : Number) -> Done
}


// Drawable sector type. Like a circle but you can define where
// (on the complex plane) it starts being drawn, and where it ends
type Sector = Drawable & {

    radius -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number

    from -> Number
    to   -> Number
}


// Drawable arc type. This is like a sector except you can define a certain
// ammount of the inside to not be filled in
type Arc = Drawable & {

    radius -> Number
    width  -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number

    from   -> Number
    to     -> Number
}


// Drawable line type
type Line = Drawable & {

    color -> col.Color
    lineWidth -> Number

    from -> vec2.Vector2
    to   -> vec2.Vector2
}


// Drawable text type
type Text = Drawable & {

    color -> col.Color
    text  -> String

    size  -> Number
}


// Drawable image type. Takes a string pathway to the image file,
// which must be a png
type Image = Drawable & {

    filename -> String

    width -> Number
    width := (w' : Number) -> Done

    height -> Number
    height := (h' : Number) -> Done
}


// Abstract class that drawable objects will inherit from
class aDrawable.at(l : vec2.Vector2) -> Drawable {

    // Cartesian coordinates for the location on the 2d plane
    var location : vec2.Vector2 is public := l

    // If true, this drawable will be drawn
    var visible  : Boolean      is public := true


    // Returns the x cartesian coordinate
    method x -> Number {

        location.x
    }

    // Returns the y cartesian coordinate
    method y -> Number {

        location.y
    }

    // Sets the x cartesian coordinate
    method x := (x' : Number) -> Done {

        location.x := x'
    }

    // Sets the y cartesian coordinate
    method y := (y' : Number) -> Done {

        location.y := y'
    }


    // Sets the x,y cartesian coordinate with a vector
    method moveTo := (l' : vec2.Vector2) -> Done {

        location := l'
    }

    // Moves the object by dx in the x direction, dy in the y direction
    method moveBy(dx : Number, dy : Number) -> Done {

        location := location + vec2.x(dx) y(dy)
    }

    // Paint this object to the canvas it is on. gfx is the graphics object
    // of the canvas
    method draw(gfx) -> Done {
        // Place Holder, this class should never be instantiated
    }
}


// Rectangle Class
class aRectangle.at(l : vec2.Vector2) sized(s : vec2.Vector2) colored(c : col.Color) -> Rectangle {

    inherits aDrawable.at(l)


    var size  : vec2.Vector2 is public := s
    var color : col.Color    is public := c

    var fill  : Boolean      is public := true
    var lineWidth : Number   is public := 2


    // Easier getters for the dimension components
    method width -> Number { size.x }
    method height -> Number { size.y }

    // Easier setters for the dimension components
    method width := (w' : Number) -> Done {

        size.x := w'
    }

    method height := (h' : Number) -> Done {

        size.y := h'
    }


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        if (fill) then {

            // Set the color
            gfx.fillStyle := color.asString

            // Draw the rectangle using stored values
            gfx.fillRect(location.x, location.y, width, height)

        } else {

            // Set the color
            gfx.strokeStyle := color.asString

            // Draw the outline of the rectangle
            gfx.beginPath
            gfx.rect(x, y, width, height)
            gfx.stroke
            gfx.closePath
        }

    }

    // Check if (x, y) is inside this rectangle
    method contains(x' : Number, y' : Number) -> Boolean is override {

        ((x <= x') && (x' <= (x + width))) && ((y <= y') && (y' <= (y + height)))
    }

    method asString -> String is override {

        var lo := "{location}"
        var c := "({color.r}, {color.g}, {color.b})"
        var d := "{size}"

        return "Rectangle at: {lo} dimensions: {d} colored: {c}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aRectangle.at(l) sized(size) colored(color)
    }
}


// Circle Class
class aCircle.around(l : vec2.Vector2) radius(r : Number) colored(c : col.Color) -> Circle {

    inherits aDrawable.at(l)

    var radius : Number    is public := r
    var color  : col.Color is public := c

    var fill   : Boolean   is public := true
    var lineWidth : Number is public := 2

    def from : Number = 0
    def to   : Number = math.two_pi


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        if (fill) then {

            gfx.fillStyle := color.asString

            gfx.beginPath
            // gfx.moveTo(x, y)
            gfx.arc(x, y, radius, 0, math.pi*2, true, 50)

            gfx.fill
            gfx.closePath

        } else {

            gfx.strokeStyle := color.asString

            gfx.beginPath
            // gfx.moveTo(x, y)
            gfx.arc(x, y, radius, 0, math.pi*2, true)

            gfx.closePath
        }
    }

    // Returns true if (x', y') is inside this circle
    method contains(x' : Number, y' : Number) -> Boolean is override {

        // Check if the radius is greater than or equal to the straight line
        // distance between the center of the circle and the point (x', y')
        radius >= math.sqrt(math.abs(((x' - x)^2) + ((y' - y)^2)))
    }


    method asString -> String is override {

        var lo := "{location}"
        var r := "{radius}"

        return "Circle around: {lo} radius: {r}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aCircle.around(l) radius(radius) colored(color)
    }
}


// Oval Class
class aOval.at(l : vec2.Vector2) sized(s : vec2.Vector2) colored(c : col.Color) -> Oval {

    inherits aDrawable.at(l)

    var size : vec2.Vector2 := s
    var color  : col.Color is public := c

    var fill   : Boolean   is public := true
    var lineWidth : Number is public := 2

    def from : Number = 0
    def to   : Number = math.two_pi


    // Easier getters for the dimension components
    method width -> Number { size.x }
    method height -> Number { size.y }

    // Easier setters for the dimension components
    method width := (w' : Number) -> Done {

        size.x := w'
    }

    method height := (h' : Number) -> Done {

        size.y := h'
    }


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        //calculate the needed values
        def kappa = 0.5522848
        def ox = (size.x / 2) * kappa
        def oy = (size.y / 2) * kappa
        def xe = x + size.x
        def ye = y + size.y
        def xm = x + (size.x / 2)
        def ym = y + (size.y / 2)

        if (fill) then {

            gfx.fillStyle := color.asString

            gfx.beginPath
            gfx.moveTo(x, ym)
            gfx.bezierCurveTo(x, ym - oy, xm - ox, y, xm, y)
            gfx.bezierCurveTo(xm + ox, y, xe, ym - oy, xe, ym)
            gfx.bezierCurveTo(xe, ym + oy, xm + ox, ye, xm, ye)
            gfx.bezierCurveTo(xm - ox, ye, x, ym + oy, x, ym)
            gfx.fill
            gfx.closePath

        } else {

            gfx.strokeStyle := color.asString

            gfx.beginPath
            gfx.moveTo(x, ym)
            gfx.bezierCurveTo(x, ym - oy, xm - ox, y, xm, y)
            gfx.bezierCurveTo(xm + ox, y, xe, ym - oy, xe, ym)
            gfx.bezierCurveTo(xe, ym + oy, xm + ox, ye, xm, ye)
            gfx.bezierCurveTo(xm - ox, ye, x, ym + oy, x, ym)
            gfx.stroke
            gfx.closePath
        }
    }

    // Check if (x, y) is inside this oval
    method contains(x' : Number, y' : Number) -> Boolean is override {

        ((x <= x') && (x' <= (x + width))) && ((y <= y') && (y' <= (y + height)))

        // (((x' - x)^2)/((width/2)^2) + (((y' - y)^2)/((height/2)^2))) <= 1
    }

    method asString -> String is override {

        var lo := "{location}"
        var w := "{width}"
        var h := "{height}"

        return "Oval around: {lo} width: {w} height: {h}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aOval.at(l) sized(size) colored(color)
    }
}


// Sector Class
class aSector.around(l : vec2.Vector2) from(f : Number) to(t : Number)
              radius(r : Number) colored(c : col.Color) -> Sector {

    inherits aDrawable.at(l)

    var radius : Number    is public := r
    var color  : col.Color is public := c

    var fill   : Boolean   is public := true
    var lineWidth : Number is public := 2


    // Where to start drawing the sector, in radians
    var from : Number is public := f

    // Where to finish drawing the sector, in radians
    var to   : Number is public := t


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {


        if (fill) then {

            gfx.beginPath
            gfx.fillStyle := color.asString
            // gfx.moveTo(x, y)
            gfx.arc(x, y, radius, from, to)
            gfx.fill
            gfx.closePath

        } else {

            gfx.beginPath
            gfx.strokeStyle := color.asString
            // gfx.moveTo(x, y)
            gfx.arc(x, y, radius, from, to)
            // gfx.fill
            gfx.closePath
        }
    }


    method asString -> String is override {

        var lo := "{location}"
        var fr := "from {from} to {to}"
        var r := "{radius}"

        return "Sector around: {lo} {fr} radius: {r}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aSector.around(l) from(from) to(to) radius(radius) colored(color)
    }
}


// Arc Class
class aArc.around(l : vec2.Vector2) from(f : Number) to(t : Number)
           radius(r : Number) width(w : Number) colored(c : col.Color) -> Arc {

    inherits aDrawable.at(l)

    var radius : Number    is public := r
    var color  : col.Color is public := c

    // The width of the arc.
    // Given a sector s1 with radius r1, the arc will be created by
    // subtracting a sector s2 from s1, where s2 has radius = r1 - width
    var width  : Number    is public := w

    var fill   : Boolean   is public := true
    var lineWidth : Number is public := 2

    var from : Number is public := f
    var to   : Number is public := t


    method draw(gfx) -> Done is override {


        if (fill) then {

            gfx.beginPath
            gfx.fillStyle := color.asString
            gfx.arc(x, y, radius, from, to)
            gfx.arc(x, y, radius - width, to, from, true)
            gfx.fill
            gfx.closePath

        } else {

            gfx.beginPath
            gfx.fillStyle := color.asString
            gfx.arc(x, y, radius, from, to)
            gfx.arc(x, y, radius - width, to, from, true)
            // gfx.fill
            gfx.closePath
        }
    }


    // Returns true if (x', y') is inside this arc
    method contains(x' : Number, y' : Number) -> Boolean is override {

        // Get the distance from the center of the arc
        def dist = math.sqrt(math.abs(((x' - x)^2) + ((y' - y)^2)))

        return (dist <= radius) && ((radius - width) <= dist)
    }

    method asString -> String is override {

        var c := "({color.r}, {color.g}, {color.b})"
        var r := "{radius}"
        var w := "{width}"

        return "Arc at: {location} radius: {r} width: {w} colored: {c}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aArc.around(l) from(from) to(to) radius(radius) width(width) colored(color)
    }
}


// Line Class
class aLine.from(f : vec2.Vector2) to(t : vec2.Vector2) colored(c : col.Color) -> Line {

    // Note that it doesn't make a lot of sense for this to inherit from drawable
    // but just take it as the "from" variable to be the drawable location
    inherits aDrawable.at(f)

    var color : col.Color is public := c

    // Width of the line is 2 by default
    var lineWidth : Number is public := 2

    // 2d cartesian coordinates for the start and end of the line
    var from : vec2.Vector2 is public := f
    var to   : vec2.Vector2 is public := t


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        gfx.strokeStyle := color.asString
        gfx.beginPath
        gfx.moveTo(from.x, from.y)
        gfx.lineTo(to.x, to.y)
        gfx.stroke
        gfx.closePath
    }

    method asString -> String is override {

        "Line from {from} to {to} with width: {lineWidth}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aLine.from(from) to(to) colored(color)
    }
}


// Text Class
class aText.write(t : String) at(l : vec2.Vector2) colored(c : col.Color) -> Text {

    inherits aDrawable.at(l)

    var text : String     is public := t
    var size : Number     is public := 10
    var color : col.Color is public := c


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        gfx.fillStyle := color.asString
        gfx.font := "{size}pt sans-serif"
        gfx.beginPath
        gfx.fillText(text, x, y)
        gfx.fill
        gfx.closePath
    }

    method asString -> String is override {

        "Text: \"{text}\" at {location}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aText.write(text) at(l) colored(color)
    }
}

// Image Class
class aImage.at(l : vec2.Vector2) sized(s : vec2.Vector2) from(path' : String) -> Image {

    inherits aDrawable.at(l)

    //TODO: fix

//    if (!io.exists(path')) then {
//
//        io.error.write("Error: no file at \"{path'}\"\n")
//        sys.exit(1)
//    }
//
//    def path    = path'
//    def surface = cairo.image_surface_create_from_png(path)
//    def iWidth  = surface.width
//    def iHeight = surface.height
//
//    var size : vec2.Vector2 := s
//
//    // Easier getters for the dimension components
//    method width -> Number { size.x }
//    method height -> Number { size.y }
//
//    // Easier setters for the dimension components
//    method width := (w' : Number) -> Done {
//
//        size.x := w'
//    }
//
//    method height := (h' : Number) -> Done {
//
//        size.y := h'
//    }
//
//    // Paint this object to the canvas
//    method draw(gfx) -> Done is override {
//
//        // TODO
//    }
//
//    // Check if (x, y) is inside this image
//    method contains(x' : Number, y' : Number) -> Boolean is override {
//
//        ((x <= x') && (x' <= (x + width))) && ((y <= y') && (y' <= (y + height)))
//    }
//
//
//    method asString -> String {
//
//        "Image at {location} from {path}"
//    }
//
//    // Returns an identical object to this
//    method clone -> Drawable {
//
//        aImage.at(l) sized(size) from(path)
//    }
}
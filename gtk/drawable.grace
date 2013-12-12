import "cairo" as cairo

import "io" as io
import "sys" as sys

import "Vector2" as vec2
import "Color"   as col
import "Math"    as math


// Abstract super class for drawable objects
type Drawable = {

    location -> vec2.Vector2
    visible -> Boolean

    x -> Number
    y -> Number

    x := (x' : Number) -> Done
    y := (y' : Number) -> Done

    moveTo := (l : vec2.Vector2) -> Done
    moveBy(dx : Number, dy : Number) -> Done

    // Takes a cairo graphics object to draw with
    draw(gfx) -> Done
}


// Drawable rectangle type
type Rectangle = Drawable & {

    size  -> vec2.Vector2
    color -> col.Color

    fill  -> Boolean
    lineWidth -> Number

    w -> Number
    h -> Number

    w := (w' : Number) -> Done
    h := (h' : Number) -> Done
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

    width -> Number
    height -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number
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


// Drawable arc type.
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
type Line = {

    color -> col.Color
    width -> Number

    from -> vec2.Vector2
    to   -> vec2.Vector2
}


// Drawable text type
type Text = Drawable & {

    color -> col.Color
    text  -> String

    size  -> Number
}


// Drawable image type
type Image = Drawable & {

    filename -> String

    width -> Number
    height -> Number
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

        location := location + vec2.setCoord(dx, dy)
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

        // Set the color
        gfx.set_source_rgb(color.r, color.g, color.b)

        // Draw the rectangle using stored values
        gfx.rectangle(x, y, width, height)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }

    method asString -> String is override {

        var lo := "{location}"
        var c := "({color.r}, {color.g}, {color.b})"
        var d := "{size}"

        return "Rectangle at: {lo} dimensions: {d} colored: {c}"
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

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.arc(x, y, radius, from, to)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }


    method asString -> String is override {

        var lo := "{location}"
        var r := "{radius}"

        return "Circle around: {lo} radius: {r}"
    }
}


// Oval Class
class aOval.at(l : vec2.Vector2) sized(s : vec2.Vector2) colored(c : col.Color) -> Circle {

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

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.save
        gfx.translate(x + width/2, y + height/2)
        gfx.scale(width/2, height/2)
        gfx.arc(0, 0, 1, from, to)
        gfx.restore

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }


    method asString -> String is override {

        var lo := "{location}"
        var w := "{width}"
        var h := "{height}"

        return "Oval around: {lo} width: {w} height: {h}"
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

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.arc(x, y, radius, from, to)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }


    method asString -> String is override {

        var lo := "{location}"
        var fr := "from {from} to {to}"
        var r := "{radius}"

        return "Sector around: {lo} {fr} radius: {r}"
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

        gfx.set_source_rgb(color.r, color.g, color.b)

        // Draw s1
        gfx.arc(x, y, radius, from, to)

        // Subtract s2
        gfx.arc_negative(x, y, radius - width, to, from)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }


    method asString -> String is override {

        var c := "({color.r}, {color.g}, {color.b})"
        var r := "{radius}"
        var w := "{width}"

        return "Arc at: {location} radius: {r} width: {w} colored: {c}"
    }
}


// Line Class
class aLine.from(f : vec2.Vector2) to(t : vec2.Vector2) colored(c : col.Color) -> Line {

    var color : col.Color is public := c

    // Width of the line is 2 by default
    var width : Number is public := 2

    // 2d cartesian coordinates for the start and end of the line
    var from : vec2.Vector2 is public := f
    var to   : vec2.Vector2 is public := t


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.move_to(from.x, from.y)
        gfx.line_to(to.x, to.y)
        gfx.line_width := width
        gfx.stroke
    }

    method asString -> String is override {

        "Line from {from} to {to} with width: {width}"
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

        gfx.font_size := size
        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.move_to(x, y)
        gfx.show_text(text)
        gfx.fill
    }

    method asString -> String is override {

        "Text: \"{text}\" at {location}"
    }
}


// Image Class
class aImage.at(l : vec2.Vector2) sized(s : vec2.Vector2) from(path' : String) -> Image {

    inherits aDrawable.at(l)

    if (!io.exists(path')) then {

        io.error.write("Error: no file at \"{path'}\"\n")
        sys.exit(1)
    }

    def path    = path'
    def surface = cairo.image_surface_create_from_png(path)
    def iWidth  = surface.width
    def iHeight = surface.height

    var size : vec2.Vector2 := s

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

        gfx.save
        gfx.translate(x, y)
        gfx.scale(width/iWidth, height/iHeight)
        gfx.set_source_surface(surface, 0, 0)
        gfx.paint
        gfx.restore
    }

    method asString -> String {

        "Image at {location} from {path}"
    }
}
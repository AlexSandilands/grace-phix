// Grace-Phix graphics library, written by Alex Sandilands
// Last revised 24/02/2014
// See https://github.com/AlexSandilands/grace-phix


import "cairo" as cairo

import "io" as io
import "sys" as sys

import "Vector2" as vec2
import "Color"   as col
import "GMath"    as math


// Abstract super class for drawable objects
type Drawable = {

    location -> vec2.Vector2
    location:= (l : vec2.Vector2) -> Done

    visible -> Boolean
    visible:= (b : Boolean) -> Done

    x -> Number
    y -> Number

    x := (x' : Number) -> Done
    y := (y' : Number) -> Done

    moveTo := (l : vec2.Vector2) -> Done
    moveBy(dx : Number, dy : Number) -> Done

    // Paints this object to a canvas, using the graphical object gfx
    // of that canvas
    draw(gfx) -> Done

    // Checks if (x, y) is inside the drawable
    contains(x : Number, y : Number) -> Boolean

    clone -> Drawable
}


// Drawable rectangle type
type Rectangle = Drawable & type {

    size  -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    color -> col.Color
    color:= (c : col.Color) -> Done

    fill  -> Boolean
    fill:= (b : Boolean)

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    width -> Number
    width := (w' : Number) -> Done

    height -> Number
    height := (h' : Number) -> Done
}


// Drawable circle type
// This is a sector, but the "from" and "to" values are constants: 0 -> 2pi
type Circle = Drawable & type {

    radius -> Number
    radius:= (r : Number) -> Done

    color  -> col.Color
    color:= (c : col.Color) -> Done

    fill      -> Boolean
    fill:= (b : Boolean) -> Done

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done
}


// Drawable oval type
type oval = Drawable & type {

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    color -> col.Color
    color:= (c : col.Color) -> Done

    fill -> Boolean
    fill:= (b : Boolean) -> Done

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    width -> Number
    width := (w' : Number) -> Done

    height -> Number
    height := (h' : Number) -> Done
}


// Drawable sector type. Like a circle but you can define where
// (on the complex plane) it starts being drawn, and where it ends
type Sector = Drawable & type {

    radius -> Number
    radius:= (r : Number) -> Done

    color -> col.Color
    color:= (c : col.Color) -> Done

    fill -> Boolean
    fill:= (b : Boolean) -> Done

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    from -> Number
    from:= (f : Number) -> Done

    to -> Number
    to:= (t : Number) -> Done
}


// Drawable arc type. This is like a sector except you can define a certain
// ammount of the inside to not be filled in
type Arc = Drawable & type {

    radius -> Number
    radius:= (r : Number) -> Done

    width -> Number
    width:= (w : Number) -> Done

    color -> col.Color
    color:= (c : col.Color) -> Done

    fill -> Boolean
    fill:= (b : Boolean) -> Done

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    from -> Number
    from:= (b : Boolean) -> Done

    to -> Number
    to:= (t : Number) -> Done
}


// Drawable line type
type Line = Drawable & type {

    color -> col.Color
    color:= (c : col.Color) -> Done

    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    from -> vec2.Vector2
    from:= (f : Number) -> Done

    to -> vec2.Vector2
    to:= (t : Number) -> Done
}


// Drawable text type
type Text = Drawable & type {

    color -> col.Color
    color:= (c : col.Color) -> Done

    text -> String
    text:= (s : String) -> Done

    fontSize -> Number
    fontSize:= (s : Number) -> Done
}


// Drawable image type. Takes a string pathway to the image file,
// which must be a png
type Image = Drawable & type {

    filename -> String
    filename:= (s : String) -> Done

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

    // Paints this object to a canvas, using the graphical object gfx
    // of that canvas
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
        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)

        // Draw the rectangle using stored values
        gfx.rectangle(x, y, width, height)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
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

        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)
        gfx.arc(x, y, radius, from, to)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
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

        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)

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

        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)
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

        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)

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

        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)
        gfx.move_to(from.x, from.y)
        gfx.line_to(to.x, to.y)
        gfx.line_width := lineWidth
        gfx.stroke

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
    var color : col.Color is public := c
    var fontSize : Number is public := 10


    // Paint this object to the canvas
    method draw(gfx) -> Done is override {

        gfx.font_size := fontSize
        gfx.set_source_rgb(color.r/255, color.g/255, color.b/255)
        gfx.move_to(x, y)
        gfx.show_text(text)
        gfx.fill
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

    // Check if (x, y) is inside this image
    method contains(x' : Number, y' : Number) -> Boolean is override {

        ((x <= x') && (x' <= (x + width))) && ((y <= y') && (y' <= (y + height)))
    }


    method asString -> String {

        "Image at {location} from {path}"
    }

    // Returns an identical object to this
    method clone -> Drawable {

        aImage.at(l) sized(size) from(path)
    }
}
import "Vector2" as vec2
import "Color"   as col
import "Math"    as math

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

type Circle = Drawable & {

    radius -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number
}

type Sector = Drawable & {

    radius -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number

    from -> Number
    to   -> Nuber
}

type Arc = Drawable & {

    radius -> Number
    width  -> Number
    color  -> col.Color

    fill      -> Boolean
    lineWidth -> Number

    from   -> Number
    to     -> Number
}

type Line = {

    color -> col.Color
    width -> Number

    from -> vec2.Vector2
    to   -> vec2.Vector2
}

type Text = {

    color -> col.Color
    text  -> String

    size  -> Number
}

type Image = {

}


// Abstract class that drawable objects will inherit from
class aDrawable.at(l : vec2.Vector2) -> Drawable {

    var location : vec2.Vector2 is public := l
    var visible : Boolean := true

    method x -> Number {

        location.x
    }

    method y -> Number {

        location.y
    }

    method x := (x' : Number) -> Done {

        location.x := x'
    }

    method y := (y' : Number) -> Done {

        location.y := y'
    }

    method moveTo := (l' : vec2.Vector2) -> Done {

        location := l'
    }

    method moveBy(dx : Number, dy : Number) -> Done {

        location := location + Vector2.setCoord(dx, dy)
    }

    method draw(gfx) -> Done is override {
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
    method w -> Number { size.x }
    method h -> Number { size.y }

    // Easier setters for the dimension components
    method w := (w' : Number) -> Done {
        size.x := w'
    }

    method h := (h' : Number) -> Done {
        size.y := h'
    }

    method draw(gfx) -> Done is override {

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.rectangle(x, y, w, h)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }

    method asString -> String is override {

        var lo := "({location.x}, {location.y})"
        var c := "[{color.r}, {color.g}, {color.b}]"
        var d := "{size.x} x {size.y}"

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

    def from : Number is public = 0
    def to   : Number is public = math.two_pi


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

        var lo := "({location.x}, {location.y})"
        var r := "{radius}"

        return "Circle around: {lo} radius: {d}"
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

    var from : Number is public := f
    var to   : Number is public := t


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

        var lo := "({location.x}, {location.y})"
        var fr := "from {from} to {to}"
        var r := "{radius}"

        return "Sector around: {lo} {fr} radius: {d}"
    }
}


// Arc Class
class aArc.around(l : vec2.Vector2) from(f : Number) to(t : Number)
           radius(r : Number) width(w : Number) colored(c : col.Color) -> Arc {

    inherits aDrawable.at(l)

    var radius : Number    is public := r
    var width  : Number    is public := w
    var color  : col.Color is public := c

    var fill   : Boolean   is public := true
    var lineWidth : Number is public := 2

    var from : Number is public
    var to   : Number is public


    method draw(gfx) -> Done is override {

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.arc(x, y, radius, from, to)
        gfx.arc_negative(x, y, radius - width, to, from)

        if (fill) then {

            gfx.fill

        } else {

            gfx.line_width := lineWidth
            gfx.stroke
        }
    }


    method asString -> String is override {

        var c := "[{color.r}, {color.g}, {color.b}]"
        var r := "{radius}"

        return "Circle at: {location} radius: {d} colored: {c}"
    }
}


// Line Class
class aLine.from(f : vec2.Vector2) to(t : vec2.Vector2) colored(c : col.Color) -> Line {

    var color : col.Color is public := c

    var width : Number is public := 2

    var from : vec2.Vector2 is public := f
    var to   : vec2.Vector2 is public := t


    method draw(gfx) -> Done is override {

        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.move_to(from.x, from.y)
        gfx.line_to(to.x, to.y)
        gfx.stroke
    }

    method asString -> String is override {

        "Line from {from} to {to}"
    }
}


// Text Class
class aText.write(t : String) at(l : vec2.Vector2) colored(c : col.Color) -> Text {

    inherits aDrawable.at(l)

    var text : String     is public := t
    var size : Number     is public := s
    var color : col.Color is public := c


    method draw(gfx) -> Done is override {

        gfx.font_size := size
        gfx.set_source_rgb(color.r, color.g, color.b)
        gfx.move_to(x, y)
        gfx.show_text(text)
        gfx.fill
    }

    method asString -> String is override {

        "Text: \"{text}\" at ({x}, {y})"
    }
}
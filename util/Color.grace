import "GMath" as math

type Color = {

    r -> Number
    g -> Number
    b -> Number
    a -> Number

    r := (r' : Number) -> Done
    g := (g' : Number) -> Done
    b := (b' : Number) -> Done
    a := (a' : Number) -> Done

    +(other : Color) -> Color

    brighter  -> Color
    darker    -> Color
    invert    -> Color
    greyscale -> Color

    asString -> String
}



method black -> Color {

    aColor.new(0, 0, 0, 255)
}


method blue -> Color {

    aColor.new(0, 0, 255, 255)
}


method cyan -> Color {

    aColor.new(0, 255, 255, 255)
}


method doge -> Color {

    aColor.new(184, 158, 97, 255)
}


method magenta -> Color {

    aColor.new(255, 0, 255, 255)
}


method grey -> Color {

    aColor.new(127.5, 127.5, 127.5, 255)
}


method green -> Color {

    aColor.new(0, 255, 0, 255)
}


method orange -> Color {

    aColor.new(255, 140, 0, 255)
}


method pink -> Color {

    aColor.new(255, 105, 179, 255)
}


method red -> Color {

    aColor.new(255, 0, 0, 255)
}


method white -> Color {

    aColor.new(255, 255, 255, 255)
}


method yellow -> Color {

    aColor.new(255, 255, 0, 255)
}


method random -> Color {

    aColor.new(math.random*255, math.random*255, math.random*255, 255)
}


method r(r' : Number) g(g' : Number) b(b' : Number) -> Color {

    aColor.new(r, g, b, 255)
}


method r(r' : Number) g(g' : Number) b(b' : Number) a(a' : Number) -> Color {

    aColor.new(r, g, b, a)
}


// Class that contains values of a color and methods for manipulating the color
// Color components are between 0 and 255
class aColor.new(red : Number, green : Number, blue : Number, alpha : Number) {

    // Components of this color
    var r' : Number := math.clamp(red) between(0, 255)
    var g' : Number := math.clamp(green) between(0, 255)
    var b' : Number := math.clamp(blue) between(0, 255)
    var a' : Number := math.clamp(alpha) between(0, 255)

    // Nicer method names for getters
    method r -> Number { r' }
    method g -> Number { g' }
    method b -> Number { b' }
    method a -> Number { a' }

    // Override the setters so values must be between 0 and 255
    method r := (new : Number) -> Done {

        r' := math.clamp(new) between(0, 255)
    }

    method g := (new : Number) -> Done {

        g' := math.clamp(new) between(0, 255)
    }

    method b := (new : Number) -> Done {

        b' := math.clamp(new) between(0, 255)
    }

    method a := (new : Number) -> Done {

        a' := math.clamp(new) between(0, 255)
    }


    // Functions

    // Additive binary operator for this color.
    method +(other : Color) -> Color {

        var newR := math.clamp(r' + other.r) below(255)
        var newG := math.clamp(g' + other.g) below(255)
        var newB := math.clamp(b' + other.b) below(255)
        var newA := math.clamp(a' + other.a) below(255)

        return aColor.new(newR, newG, newB, newA)
    }

    // Returns a brighter copy of this color, by a factor of 0.7
    method brighter -> Color {

        if((r' == 0) && (g' == 0) && (b' == 0)) then {

            var newR := 127.5
            var newG := 127.5
            var newB := 127.5

            return aColor.new(newR, newG, newB, a')
        }

        // Deal with Red component
        var newR := math.clamp(r' / 0.7) below(255)

        // Deal with Green component
        var newG := math.clamp(g' / 0.7) below(255)

        // Deal with Blue component
        var newB := math.clamp(b' / 0.7) below(255)


        return aColor.new(newR, newG, newB, a')
    }

    // Returns a darker copy of this color, by a factor of 0.7
    method darker -> Color {

        // Deal with Red component
        var newR := math.clamp(r' * 0.7) above(0)

        // Deal with Green component
        var newG := math.clamp(g' * 0.7) above(0)

        // Deal with Blue component
        var newB := math.clamp(b' * 0.7) above(0)


        return aColor.new(newR, newG, newB, a')
    }



    // Returns an inverted copy of this color
    method invert -> Color {

        var newR := 255 - r'
        var newG := 255 - g'
        var newB := 255 - b'


        return aColor.new(newR, newG, newB, a')
    }



    // Returns a greyscale copy of this color
    method greyscale -> Color {

        var avg := (r' + g' + b')/3

        var newR := avg
        var newG := avg
        var newB := avg


        return aColor.new(newR, newG, newB, a')
    }





    // Overide the asString method
    method asString -> String is override {

        "rgb({r}, {g}, {b})"
    }


}
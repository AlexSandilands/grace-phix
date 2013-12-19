import "Math" as math

type Color = {

    r -> Number
    g -> Number
    b -> Number
    a -> Number

    r := (r' : Number) -> Done
    g := (g' : Number) -> Done
    b := (b' : Number) -> Done
    a := (a' : Number) -> Done
}


method black -> Color {

    aColor.new(0, 0, 0, 1)
}


method blue -> Color {

    aColor.new(0, 0, 1, 1)
}


method cyan -> Color {

    aColor.new(0, 1, 1, 1)
}


method doge -> Color {

    aColor.new(0.72, 0.62, 0.38, 1)
}


method magenta -> Color {

    aColor.new(1, 0, 1, 1)
}


method gray -> Color {

    aColor.new(0.5, 0.5, 0.5, 1)
}


method green -> Color {

    aColor.new(0, 1, 0, 1)
}


method orange -> Color {

    aColor.new(1, 0.55, 0, 1)
}


method pink -> Color {

    aColor.new(1, 0.41, 0.7, 1)
}


method red -> Color {

    aColor.new(1, 0, 0, 1)
}


method white -> Color {

    aColor.new(1, 1, 1, 1)
}


method yellow -> Color {

    aColor.new(1, 1, 0, 1)
}


method fromRGB(r : Number, g : Number, b : Number) -> Color {

    aColor.new(r, g, b, 1)
}


method fromRGB(r : Number, g : Number, b : Number) withAlpha(a : Number) -> Color {

    aColor.new(r, g, b, a)
}


// Class that contains values of a color and methods for manipulating the color
class aColor.new(red : Number, green : Number, blue : Number, alpha : Number) {

    // Components of this color
    var r' : Number := math.clamp(red) between(0, 1)
    var g' : Number := math.clamp(green) between(0, 1)
    var b' : Number := math.clamp(blue) between(0, 1)
    var a' : Number := math.clamp(alpha) between(0, 1)

    // Nicer method names for getters
    method r -> Number { r' }
    method g -> Number { g' }
    method b -> Number { b' }
    method a -> Number { a' }

    // Override the setters so values must be between 0 and 1
    method r := (new : Number) -> Done {

        r' := math.clamp(new) between(0, 1)
    }

    method g := (new : Number) -> Done {

        g' := math.clamp(new) between(0, 1)
    }

    method b := (new : Number) -> Done {

        b' := math.clamp(new) between(0, 1)
    }

    method a := (new : Number) -> Done {

        a' := math.clamp(new) between(0, 1)
    }


    // Functions

    // Returns a slightly brighter copy of this color, by a factor of 0.7
    method brighter -> Color {

        if((r' == 0) && (g' == 0) && (b' == 0)) then {

            var newR := 0.5
            var newG := 0.5
            var newB := 0.5

            return aColor.new(newR, newG, newB, a')
        }

        // Deal with Red component
        var newR := math.clamp(r' / 0.7) below(1)

        // Deal with Green component
        var newG := math.clamp(g' / 0.7) below(1)

        // Deal with Blue component
        var newB := math.clamp(b' / 0.7) below(1)


        return aColor.new(newR, newG, newB, a')
    }

    // Returns a slightly darker copy of this color, by a factor of 0.7
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

        var newR := 1 - r'
        var newG := 1 - g'
        var newB := 1 - b'


        return aColor.new(newR, newG, newB, a')
    }



    // Grayscales this color
    method grayscale -> Color {

        var avg := (r' + g' + b')/3

        var newR := avg
        var newG := avg
        var newB := avg


        return aColor.new(newR, newG, newB, a')
    }



    // Additive binary operator for colors. Works like adding lights
    method +(other : Color) -> Color {

        var newR := math.clamp(r' + other.r) below(1)
        var newG := math.clamp(g' + other.g) below(1)
        var newB := math.clamp(b' + other.b) below(1)
        var newA := math.clamp(a' + other.a) below(1)

        return aColor.new(newR, newG, newB, newA)
    }


    // Overide the asString method
    method asString -> String is override {

        "rgb({r}, {g}, {b})"
    }


}
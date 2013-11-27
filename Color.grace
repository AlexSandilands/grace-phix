import "PhixMath" as math


method black -> Color {

    Color.new(0, 0, 0, 1)
}


method blue -> Color {

    Color.new(0, 0, 1, 1)
}


method cyan -> Color {

    Color.new(0, 1, 1, 1)
}


method doge -> Color {

    Color.new(0.72, 0.62, 0.38, 1)
}


method magenta -> Color {

    Color.new(1, 0, 1, 1)
}


method gray -> Color {

    Color.new(0.5, 0.5, 0.5, 1)
}


method green -> Color {

    Color.new(0, 1, 0, 1)
}


method orange -> Color {

    Color.new(1, 0.55, 0, 1)
}


method pink -> Color {

    Color.new(1, 0.41, 0.7, 1)
}


method red -> Color {

    Color.new(1, 0, 0, 1)
}


method white -> Color {

    Color.new(1, 1, 1, 1)
}


method yellow -> Color {

    Color.new(1, 1, 0, 1)
}


method fromRGB(r : Number, g : Number, b : Number) -> Color {

    Color.new(r, g, b, 1)
}


method fromRGB(r : Number, g : Number, b : Number) withAlpha(a : Number) -> Color {

    Color.new(r, g, b, a)
}


// Class that contains values of a color and methods for manipulating the color
class Color.new(r' : Number, g' : Number, b' : Number, a' : Number) {

    // Components of this color
    var r : Number is public := math.clamp(r') between(0, 1)
    var g : Number is public := math.clamp(g') between(0, 1)
    var b : Number is public := math.clamp(b') between(0, 1)
    var a : Number is public := math.clamp(a') between(0, 1)


    // Returns a slightly brighter copy of this color, by a factor of 0.7
    method brighter -> Color is public {

        if((r == 0) && (g == 0) && (b == 0)) then {

            var newR := 0.5
            var newG := 0.5
            var newB := 0.5

            return Color.new(newR, newG, newB, a)
        }

        // Deal with Red component
        var newR := math.clamp(r / 0.7) below(1)

        // Deal with Green component
        var newG := math.clamp(g / 0.7) below(1)

        // Deal with Blue component
        var newB := math.clamp(b / 0.7) below(1)


        return Color.new(newR, newG, newB, a)
    }

    // Returns a slightly darker copy of this color, by a factor of 0.7
    method darker -> Color is public {

        // Deal with Red component
        var newR := math.clamp(r * 0.7) above(0)

        // Deal with Green component
        var newG := math.clamp(g * 0.7) above(0)

        // Deal with Blue component
        var newB := math.clamp(b * 0.7) above(0)


        return Color.new(newR, newG, newB, a)
    }



    // Returns an inverted copy of this color
    method invert -> Color is public {

        var newR := 1 - r
        var newG := 1 - g
        var newB := 1 - b


        return Color.new(newR, newG, newB, a)
    }



    // Grayscales this color
    method grayscale -> Color is public {

        var avg := (r + g + b)/3

        var newR := avg
        var newG := avg
        var newB := avg


        return Color.new(newR, newG, newB, a)
    }



    // Additive binary operator for colors. Works like adding lights
    method +(other : Color) -> Color is public {

        var newR := math.clamp(self.r + other.r) below(1)
        var newG := math.clamp(self.g + other.g) below(1)
        var newB := math.clamp(self.b + other.b) below(1)
        var newA := math.clamp(self.a + other.a) below(1)

        return Color.new(newR, newG, newB, newA)
    }


    // Overide the asString method
    method asString -> String is public {

        "Color: r=" ++ r ++ " g=" ++ g ++ " b=" ++ b ++ " a=" ++ a
    }


}
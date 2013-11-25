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
    var r : Number is public := r'
    var g : Number is public := g'
    var b : Number is public := b'
    var a : Number is public := a'


    var factor : Number is confidential := 0.7


    // Makes this color object slightly brighter, by a factor of 0.7
    method brighter -> Done is public {

        // Deal with Red component
        if(r == 0) then {
            r := r + 0.1

        } elseif((r/0.7) > 1) then {
            r := 1

        } else {
            r := r / 0.7
        }


        // Deal with Green component
        if(g == 0) then {
            g := g + 0.1

        } elseif((g/0.7) > 1) then {
            g := 1

        } else {
            g := g / 0.7
        }


        // Deal with Blue component
        if(b == 0) then {
            b := b + 0.1

        } elseif((b/0.7) > 1) then {
            b := 1

        } else {
            b := b / 0.7
        }

    }

    // Makes this color object slightly darker, by a factor of 0.7
    method darker -> Done is public {
        // Deal with Red component
        if(r == 0) then {
            r := 0

        } elseif((r*0.7) < 0) then {
            r := 0

        } else {
            r := r * 0.7
        }


        // Deal with Green component
        if(g == 0) then {
            g := 0

        } elseif((g*0.7) < 0) then {
            g := 0

        } else {
            g := g * 0.7
        }


        // Deal with Blue component
        if(b == 0) then {
            b := 0

        } elseif((b*0.7) < 0) then {
            b := 0

        } else {
            b := b * 0.7
        }
    }

    // Inverts each component of this color
    method invert -> Done is public {
        r := 1 - r
        g := 1 - g
        b := 1 - b
    }


    // Grayscales this color
    method grayscale -> Done is public {
        var avg := (r + g + b)/3
        r := avg
        g := avg
        b := avg
    }


    // Additive binary operator for colors. Works like adding lights
    method +(other : Color) -> Color is public {
        Color.new(self.r + other.r, self.g + other.g, self.b + other.b, self.a + other.a)
    }


    // Overide the asString method
    method asString -> String is public {
        "Color: r=" ++ r ++ " g=" ++ g ++ " b=" ++ b ++ " a=" ++ a
    }


}
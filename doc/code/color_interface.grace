
// Object that holds the rgba components of a color.
// Values are between 0 and 1
type Color = {

    // Returns the red component of this color
    r -> Number

    // Returns the green component of this color
    g -> Number

    // Returns the blue component of this color
    b -> Number

    // Returns the alpha component of this color
    a -> Number

    // Sets the red component of this color
    r := (r' : Number) -> Done

    // Sets the green component of this color
    g := (g' : Number) -> Done

    // Sets the blue component of this color
    b := (b' : Number) -> Done

    // Sets the alpha component of this color
    a := (a' : Number) -> Done


    // Additive binary operator for this color.
    +(other : Color) -> Color

    // Returns a brighter copy of this color, by a factor of 0.7
    brighter -> Color

    // Returns a darker copy of this color, by a factor of 0.7
    darker -> Color

    // Returns an inverted copy of this color
    invert -> Color

    // Returns a greyscale copy of this color
    greyscale -> Color

    // Returns a string of this color, format: rgb(r, g, b)
    asString -> String
}

// -----------------
// CONSTRUCTOR METHODS
// -----------------

// Constructs and returns a black color object
method black -> Color

// Constructs and returns a blue color object
method blue -> Color

// Constructs and returns a cyan color object
method cyan -> Color

// Constructs and returns a doge color object
method doge -> Color

// Constructs and returns a magenta color object
method magenta -> Color

// Constructs and returns a grey color object
method grey -> Color

// Constructs and returns a green color object
method green -> Color

// Constructs and returns a orange color object
method orange -> Color
// Constructs and returns a pink color object
method pink -> Color

// Constructs and returns a red color object
method red -> Color

// Constructs and returns a white color object
method white -> Color

// Constructs and returns a yellow color object
method yellow -> Color

// Constructs and returns a color object from input r,g,b values
method fromRGB(r : Number, g : Number, b : Number) -> Color

// Constructs and returns a color object from input r,g,b,a values
method fromRGB(r : Number, g : Number, b : Number) withAlpha(a : Number) -> Color

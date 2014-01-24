

// Abstract super class for drawable objects
type Drawable = {

    // Cartesian coordinates for the location on the 2d plane
    location -> Vector2

    // If true, this drawable will be drawn
    visible -> Boolean

    // Returns the x cartesian coordinate
    x -> Number

    // Returns the y cartesian coordinate
    y -> Number

    // Sets the x cartesian coordinate
    x := (x' : Number) -> Done

    // Sets the y cartesian coordinate
    y := (y' : Number) -> Done

    // Sets the x,y cartesian coordinate with a vector
    moveTo := (l : Vector2) -> Done

    // Moves the object by dx in the x direction, dy in the y direction
    moveBy(dx : Number, dy : Number) -> Done

    // Paints this object to a canvas, using the graphical object gfx
    // of that canvas
    draw(gfx) -> Done

    // Checks if (x, y) is inside the drawable
    contains(x : Number, y : Number) -> Boolean

    // Returns an identical object
    clone -> Drawable
}



// Drawable rectangle type
type Rectangle = Drawable & {

    // Vector holding the width and height of this rectangle
    // First component is width, second is height
    size  -> Vector2

    // The color of this rectangle
    color -> Color

    // Defines whether this rectangle should filled
    fill  -> Boolean

    // If not filled, this is the width of the outline
    lineWidth -> Number

    // Returns the width of this rectangle
    width -> Number

    // Sets the width of this rectangle
    width := (w' : Number) -> Done

    // Returns the height of this rectangle
    height -> Number

    // Sets the height of this rectangle
    height := (h' : Number) -> Done
}


// Drawable circle type
// This is a sector, but the "from" and "to" values are constants: 0 -> 2pi
type Circle = Drawable & {

    // The radius of this circle
    radius -> Number

    // The color of this circle
    color  -> Color

    // Defines whether this circle should filled
    fill      -> Boolean

    // If not filled, this is the width of the outline
    lineWidth -> Number
}







// Drawable oval type
type oval = Drawable & {

    // Vector holding the width and height of this oval
    // First component is width, second is height
    size -> Vector2

    // The color of this oval
    color  -> Color

    // Defines whether this oval should be filled
    fill      -> Boolean

    // If not filled, this is the width of the outline
    lineWidth -> Number

    // Returns the width of the oval
    width -> Number

    // Sets the width of the oval
    width := (w' : Number) -> Done

    // Returns the height of the oval
    height -> Number

    // Sets the height of the oval
    height := (h' : Number) -> Done
}


// Drawable sector type. Like a circle but you can define where
// (on the complex plane) it starts being drawn, and where it ends
type Sector = Drawable & {

    // The radius of the sector
    radius -> Number

    // The color of this sector
    color  -> Color

    // Defines whether this sector should be filled
    fill      -> Boolean

    // If not filled, this is the width of the line
    lineWidth -> Number

    // Angle the sector starts drawing from (in radians)
    from -> Number

    // Angle the sector stops drawing at (in radians)
    to   -> Number
}


// Drawable arc type. This is like a sector except you can define a certain
// ammount of the inside to not be filled in
type Arc = Drawable & {

    // The radius of the arc
    radius -> Number

    // The width of the arc
    width  -> Number

    // The color of the arc
    color  -> Color

    // Defines whether this arc should be filled
    fill      -> Boolean

    // If not filled, this is the width of the outline
    lineWidth -> Number

    // Angle the arc starts drawing from (in radians)
    from   -> Number

    // Angle the arc stops drawing at (in radians)
    to     -> Number
}


// Drawable line type
type Line = Drawable & {

    // The color of the line
    color -> Color

    // The width of the line
    lineWidth -> Number

    // Catesian coordinates of the start of the line
    from -> Vector2

    // Cartesian coordinates of the end of the line
    to   -> Vector2
}










// Drawable text type
type Text = Drawable & {

    // The color of the text
    color -> Color

    // The string that this text writes
    text  -> String

    // The font size of the text
    size  -> Number
}


// Drawable image type. Takes a string pathway to the image file,
// which must be a png
type Image = Drawable & {

    // Path to the image, relative to the file that is using this object
    filename -> String

    // Returns the width of the image
    width -> Number

    // Sets the width of the image
    width := (w' : Number) -> Done

    // Returns the height of the image
    height -> Number

    // Sets the height of the image
    height := (h' : Number) -> Done
}

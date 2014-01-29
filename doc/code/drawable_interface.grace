

// Abstract super class for drawable objects
type Drawable = {

    // The cartesian coordinates for the location on the 2d plane
    location -> Vector2
    location:= (l : Vector2) -> Done

    // If true, this drawable will be drawn
    visible -> Boolean
    visible:= (b : Boolean) > Done

    // The x cartesian coordinate
    x -> Number
    x := (x' : Number) -> Done

    // The y cartesian coordinate
    y -> Number
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
    size:= (s : Vector2) -> Done

    // The color of this rectangle
    color -> Color
    color:= (c : Color) -> Done

    // Defines whether this rectangle should filled
    fill -> Boolean
    fill:= (b : Boolean) -> Done

    // If not filled, this is the width of the outline
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    // The width of the rectangle
    width -> Number
    width := (w' : Number) -> Done

    // The height of the rectangle
    height -> Number
    height := (h' : Number) -> Done
}


// Drawable circle type
// This is a sector, but the "from" and "to" values are constants: 0 -> 2pi
type Circle = Drawable & {

    // The radius of this circle
    radius -> Number
    radius:= (r : Number) -> Done

    // The color of this circle
    color  -> Color
    color:= (c : Color) -> Done

    // Defines whether this circle should filled
    fill -> Boolean
    fill(b : Boolean) -> Done

    // If not filled, this is the width of the outline
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done
}







// Drawable oval type
type oval = Drawable & {

    // Vector holding the width and height of this oval
    // First component is width, second is height
    size -> Vector2
    size:= (s : Vector2) -> Done

    // The color of this oval
    color  -> Color
    color:= (c : Color) -> Done

    // Defines whether this oval should be filled
    fill -> Boolean
    fill:= (b : Boolean) -> Done

    // If not filled, this is the width of the outline
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    // The width of the oval
    width -> Number
    width := (w' : Number) -> Done

    // The height of the oval
    height -> Number
    height := (h' : Number) -> Done
}


// Drawable sector type. Like a circle but you can define where
// (on the complex plane) it starts being drawn, and where it ends
type Sector = Drawable & {

    // The radius of the sector
    radius -> Number
    radius:= (r : Number) -> Done

    // The color of this sector
    color  -> Color
    color:= (c : Color) -> Done

    // Defines whether this sector should be filled
    fill -> Boolean
    fill:= (b : Boolean) -> Done

    // If not filled, this is the width of the line
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    // Angle the sector starts drawing from (in radians)
    from -> Number
    from:= (f : Number) -> Done

    // Angle the sector stops drawing at (in radians)
    to   -> Number
    to:= (t : Number) -> Done
}


// Drawable arc type. This is like a sector except you can define a certain
// ammount of the inside to not be filled in
type Arc = Drawable & {

    // The radius of the arc
    radius -> Number
    radius:= (r : Number) -> Done

    // The width of the arc
    width -> Number
    width:= (w : Number) -> Done

    // The color of the arc
    color -> Color
    color:= (c : Color) -> Done

    // Defines whether this arc should be filled
    fill -> Boolean
    fill:= (b : Boolean) -> Done

    // If not filled, this is the width of the outline
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    // Angle the arc starts drawing from (in radians)
    from -> Number
    from:= (f : Number) -> Done

    // Angle the arc stops drawing at (in radians)
    to -> Number
    to:= (t : Number) -> Done
}


// Drawable line type
type Line = Drawable & {

    // The color of the line
    color -> Color
    color:= (c : Color) -> Done

    // The width of the line
    lineWidth -> Number
    lineWidth:= (w : Number) -> Done

    // Catesian coordinates of the start of the line
    from -> Vector2
    from:= (f : Number) -> Done

    // Cartesian coordinates of the end of the line
    to -> Vector2
    to:= (t : Number) -> Done
}










// Drawable text type
type Text = Drawable & {

    // The color of the text
    color -> Color
    color:= (c : Color) -> Done

    // The string that this text writes
    text -> String
    text:= (s : String) -> Done

    // The font size of the text
    fontSize -> Number
    fontSize:= (s : Number) -> Done
}


// Drawable image type. Takes a string pathway to the image file,
// which must be a png
type Image = Drawable & {

    // Path to the image, relative to the file that is using this object
    filename -> String
    filename:= (s : String) -> Done

    // The width of the image
    width -> Number
    width := (w' : Number) -> Done

    // The height of the image
    height -> Number
    height := (h' : Number) -> Done
}

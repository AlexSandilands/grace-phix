type Canvas = Component & {

    // Adds a drawable object d to the canvas.
    // The same drawable object cannot be added more than once, so clone it before adding a new one.
    // A set could work here, but it would make the ordering methods much more complicated.
    // Lists are also very readable
    add(d : Drawable) -> Boolean

    // Adds the list l of drawables to the canvas.
    // If one of the drawables is already on the canvas then the method
    // will break and return false, with the rest of the drawables in l
    // not being added.
    addAll(l : List<Drawable>) -> Boolean

    // Remove the drawable d from the canvas.
    // Returns true if one instance was found and removed, or false otherwise.
    remove(d : Drawable) -> Boolean

    // Removes the drawable at the index ind.
    // Returns false if the index was out of bounds.
    removeWithIndex(ind : Number) -> Boolean

    // Returns the drawable at index ind
    getWithIndex(ind : Number) -> Drawable

    // Returns the index of the top drawable that contains (x, y) or
    // 0 if none are found. Note that it searchs from the end of the list
    // to the beggining of the list, as when painting the canvas paints from
    // the start of the list.
    findDrawableAt(x : Number, y : Number) -> Number

    // Sends the drawable d to the back of the display buffer
    sendToBack(d : Drawable) -> Done

    // Sends the drawable at index ind to the back of the display buffer
    sendIndexToBack(ind : Number) -> Done

    // Brings the drawable d to the front of the display buffer
    bringToFront(d : Drawable) -> Done


    // Brings the drawable at the index ind to the front of the display buffer
    bringIndexToFront(ind : Number) -> Done


    // Sends the drawable d back one position in the draw order
    sendBack(d : Drawable) -> Done

    // Sends the drawable at index ind back one position in the draw order
    sendIndexBack(ind : Number) -> Done

    // Brings the drawable d forward one position in the draw order
    bringForward(d : Drawable) -> Done

    // Brings the drawable at index ind forward one position in the draw order
    bringIndexForward(ind : Number) -> Done

    // Gets the size of this canvas as a 2d Vector
    // First component is width, second is height
    size -> Vector2

    // Sets the size of this canvas with a 2d Vector s'
    // First component is width, second is height
    size:= (s : Vector2) -> Done

    // Returns the width of this canvas
    width -> Number

    // Set the width of this canvas
    width:= (w' : Number) -> Done

    // Returns the height of this canvas
    height -> Number

    // Set the height of this canvas
    height:= (h' : Number) -> Done

    // Set whether this canvas can actually paint things. True by default
    setPaintable(b : Boolean) -> Done

    // Asks the canvas to repaint
    paint -> Done

    // Returns a string with infomation about this canvas
    asString -> String









    // ----------------
    //  DRAWNING METHODS
    // ----------------

    // The color that shapes will be drawn with when using the canvas draw methods
    color -> col.Color

    // Defines whether or not the shapes drawn by the canvas will be filled
    fill  -> Boolean

    // Sets what happens when the mouse is pressed inside the canvas
    mousePressed:=  (b : Block) -> Done

    // Sets what happens when the mouse is released inside the canvas
    mouseReleased:= (b : Block) -> Done

    // Sets what happens when the mouse is clicked inside the canvas
    mouseClicked:=  (b : Block) -> Done

    // Rectangle at (x, y) sized wxh colored c
    drawRectangleAt(x : Number, y : Number) sized(w : Number, h : Number) -> Drawable

    // Circle around (x, y) radius r colored c
    drawCircleAround(x : Number, y : Number) radius(r : Number) -> Drawable

    // Oval around (x, y) size wxh colored c
    drawOvalAt(x : Number, y : Number) sized(w : Number, h : Number) -> Drawable

    // Sector around (x, y) radius r from f to t colored c
    drawSectorAround(x : Number, y : Number)
                from(f : Number)
                  to(t : Number)
              radius(r : Number) -> Drawable


    // Arc around (x, y) radius r width w from f to t colored c
    drawArcAround(x : Number, y : Number)
             from(f : Number)
               to(t : Number)
           radius(r : Number)
            width(w : Number) -> Drawable


    // Line from (x1, y1) to (x2, y2) colored b
    drawLineFrom(x1 : Number, y1 : Number) to(x2 : Number, y2 : Number) -> Drawable

    // Line at (x, y) with length l and anti-clockwise angle a in radians
    drawLineAt(x : Number, y : Number) length(l : Number) angle(a : Number) -> Drawable

    // Text saying t at (x, y) colored c
    drawTextSaying(t : String) at(x : Number, y : Number) -> Drawable


    // Image at (x, y) sized wxh from file: path
    drawImageAt(x : Number, y : Number)
          sized(w : Number, h : Number)
           from(path : String) -> Drawable

}

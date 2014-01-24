
type Window = Container & {

    // Displays the window and all components in the window
    // then starts the main loop.
    display -> Done

    // Return the title of this window
    title -> String

    // Sets the title of this window
    title:= (t : String) -> Done

    // Return the size of this window with a vector
    // First component is width, second is height
    size -> Vector2

    // Set the size of this window with a vector
    // First component is width, second is height
    size:= (s : Vector2) -> Done

    // Return the width of this window
    width -> Number

    // Set the width of this window
    width:= (w' : Number) -> Done

    // Return the height of this window
    height -> Number

    // Set the height of this window
    height:= (h' : Number) -> Done

    // Return the position of this window with a vector
    // First component is width, second is height
    position -> Vector2

    // Set the posistion of this window with a vector
    // First component is width, second is height
    position:= (p : Vector2) -> Done

    // Set what happens when the mouse is pressed in this window
    mousePressed:=  (b : Block) -> Done

    // Set what happens when the mouse is released in this window
    mouseReleased:= (b : Block) -> Done

    // Set what happens when the mouse is dragged in this window
    mouseDragged:=  (b : Block) -> Done

    // Sets what happens when the key is pressed
    onKey(key : String) do(b : Block) -> Done

    asString -> String
}

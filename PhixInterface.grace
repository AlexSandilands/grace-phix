import "Vector2" as Vector2

//REQUIRED
//method createWindow(t : Title) withSize(s : Vector2) at(p : Vector2) -> Window

//WINDOW TYPE
type WindowType = {

    //METHODS
    //actually displays the window
    display -> Done

    //returns a string representation of the window
    asString -> String

    //GETTERS
    //returns the title of the window
    getTitle -> String
    //returns the size of the window
    getSize -> Vector2
    //returns the position of the window
    getPosition -> Vector2

    //SETTERS
    //sets the title of the window
    setTitle(t : String) -> Done
    //sets the size of the window
    setSize(s : Vector2) -> Done
    //sets the position of the window
    setPosition(p : Vector2) -> Done
}

//CANVAS TYPE
type CanvasType = {
}

//DRAWABLE
type DrawableType = {
}
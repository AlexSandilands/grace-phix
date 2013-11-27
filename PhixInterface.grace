import "Vector2" as Vector2

//REQUIRED
//method createWindow(t : Title) withSize(s : Vector2) at(p : Vector2) -> Window

//WINDOW TYPE
type WindowType = {

    //VARIABLES
    title -> String
    size -> Vector2
    position -> Vector2

    //METHODS
    //actually displays the window
    display -> Done

    //SETTERS
    //sets the title of the window
    setTitle(t : String) -> Done
    //sets the size
    setSize(s : Vector2) -> Done
    //sets the position
    setPosition(p : Vector2) -> Done

    //GETTERS
    //returns the title of the window
    getTitle -> String
    //returns the size of the window
    getSize -> Vector2
    //returns the position of the window
    getPosition -> Vector2

}

//CANVAS TYPE
type CanvasType = {
}

//DRAWABLE
type DrawableType = {
}
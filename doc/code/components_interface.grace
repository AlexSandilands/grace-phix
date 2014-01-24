

// Top level type for graphical user interface objects.
type Component = {

    parent -> Component

    // TODO
    // This type also has a getComponent method which returns the
    // actual graphics object this type wraps up. Not sure how to
    // approach this as the type would be different for different
    // backend graphics libraries.
}



// Type for components that can contain other components
type Container = Component & {

    // Adds component c to this container.
    // Returns true if added, false if c was already in the container
    add(c : Component)          -> Boolean

    // Adds every component in the list l to this container.
    // Returns false if one of the components was already in the container
    addAll(l : List<Component>) -> Boolean

    // Attempts to remove the component c from this container
    remove(c : Component)       -> Boolean

    // Returns a list of all the components in this container
    getChildren -> List<Component>
}








// Type for a button, which is a component that can be clicked
// to perform actions
type Button = Component & {

    // Returns the label on this button
    label -> String

    // Sets the label on this button
    label:= (s : String) -> Done

    // Returns a vector of the width and height of this button
    // First coordinate is width, second is height
    size -> Vector2

    // Sets the size of this button, with a vector
    // First coordinate is width, second is height
    sized:= (s' : Vector2) -> Done

    // Returns the width of this button
    width -> Number

    // Sets the width of this button
    width:= -> Done

    // Returns the height of this button
    height -> Number

    // Sets the height of this button
    height:= -> Done

    // Sets what happens when this button is clicked
    clicked(b : Block)  -> Done

    // Sets what happens when this button is pressed
    pressed(b : Block)  -> Done

    // Sets what happens when this button is released
    released(b : Block) -> Done
}

import "gtk" as gtk

import "Vector2" as vec2


// This module is for the graphics components that aren't big
// enough to be put into their own module


// ---------------------------------- //
//                                    //
//          TYPE DEFINITIONS          //
//                                    //
// ---------------------------------- //


type Component = {

    parent -> Component

    // This type should also have a getComponent method which returns the
    // actual gtk widget this type wraps up.
    // This can't be enforced however because gtk.widget doesn't have a type
}


type Container = Component & {

    add(c : Component)    -> Done
    remove(c : Component) -> Boolean

    getChildren -> List<Component>
}

type Button = Component & {

    label -> String
    label:= (s : String) -> Done

    width -> Number
    height -> Number

    width:= -> Done
    height:= -> Done

    clicked(b : Block)  -> Done
    pressed(b : Block)  -> Done
    released(b : Block) -> Done
}




// ---------------------------------- //
//                                    //
//        IMPLEMENTED CLASSES         //
//                                    //
// ---------------------------------- //



class aVerticalBox.new -> Container {

    def vbox = gtk.box(gtk.GTK_ORIENTATION_VERTICAL, 6)

    var l : List<Component> := []


    // COMPONENT METHODS

    var parent : Component is public

    // Get the gtk component for this box
    method getComponent {

        vbox
    }


    // CONTAINER METHODS

    method add(c : Component) -> Boolean {

        // Check to see if the component is already in the container
        if (!l.contains(c)) then {

            l.push(c)
            vbox.add(c.getComponent)
            return true

        } else {

            return false
        }

    }

    // Removes the component c from this container
    // This sometimes results in the component being destroyed,
    // so make a referece to it before removing if you want to keep it
    method remove(c : Component) -> Boolean {

        var new : List<Component> := []

        // Add every component in the box to a new list,
        // apart from the on being removed
        for (l) do { other ->

            if (c != other) then {

                new.push(other)
            }
        }

        // Check if the component was in this box
        if (l.size == new.size) then {

            // If not, do nothing and return false
            return false

        } else {

            // Otherwise remove the component and return true
            l := new
            vbox.remove(c.getComponent)

            return true
        }
    }

    method getChildren -> List<Component> {

        l
    }
}


class aHorizontalBox.new -> Container {

    def hbox = gtk.box(gtk.GTK_ORIENTATION_HORIZONTAL, 6)

    var l : List<Component> := []

    var w : Number
    var h : Number


    // COMPONENT METHODS

    var parent : Component is public

    // Get the gtk component for this box
    method getComponent {

        hbox
    }


    // CONTAINER METHODS

    method add(c : Component) -> Boolean {

        // Check to see if the component is already in the container
        if (!l.contains(c)) then {

            l.push(c)
            hbox.add(c.getComponent)
            return true

        } else {

            return false
        }

    }

    // Removes the component c from this container
    // This sometimes results in the component being destroyed,
    // so make a referece to it before removing if you want to keep it
    method remove(c : Component) -> Boolean {

        var new : List<Component> := []

        // Add every component in the box to a new list,
        // apart from the on being removed
        for (l) do { other ->

            if (c != other) then {

                new.push(other)
            }
        }

        // Check if the component was in this box
        if (l.size == new.size) then {

            // If not, do nothing and return false
            return false

        } else {

            // Otherwise remove the component and return true
            l := new
            hbox.remove(c.getComponent)

            return true
        }

    }

    method getChildren -> List<Component> {

        l
    }
}


class aButton.new -> Button {

    def b = gtk.button
    var l : String := "Default Button"
    b.label := l

    // COMPONENT METHODS

    var parent : Component is public

    method getComponent {

        b
    }


    // BUTTON METHODS

    method setSize(w : Number, h : Number) -> Done {

        b.set_size_request(w, h)
    }

    // Return the label on this button
    method label -> String {

        l
    }

    // Set the label on this button
    method label := (l' : String) -> Done {

        l := l'
        b.label := l
    }


    // Button actions.

    var clickedBlock  := {}
    var pressedBlock  := {}
    var releasedBlock := {}

    b.on "clicked" do {

        clickedBlock.apply
    }

    b.on "pressed" do {

        pressedBlock.apply
    }

    b.on "released" do {

        pressedBlock.apply
    }

    // Set the block of code that will execute when this button is pressed
    method clicked := (b : Block) -> Done {

        clickedBlock := b
    }

    method pressed := (b : Block) -> Done {

        pressedBlock := b
    }

    method released := (b : Block) -> Done {

        releasedBlock := b
    }
}
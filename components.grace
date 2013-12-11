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

    method add(c : Component) -> Done {

        // Check to see if the component is already in the container
        if (!l.contains(c)) then {

            l.push(c)
            vbox.add(c)
        }

    }

    // Removes the component c from this container
    // This sometimes results in the component being destroyed,
    // so make a referece to it before removing if you want to keep it
    method remove(c : Component) {

        var new : List<Component> := []

        for (l) do { other ->

            if (c != other) then {

                new.push(other)
            }
        }

        l := new

        vbox.remove(c.getComponent)
    }

    method getChildren -> List<Component> {

        l
    }
}


class aHorizontalBox.new -> Container {

    def hbox = gtk.box(gtk.GTK_ORIENTATION_HORIZONTAL, 6)

    var l : List<Component> := []


    // COMPONENT METHODS

    var parent : Component is public

    // Get the gtk component for this box
    method getComponent {

        hbox
    }


    // CONTAINER METHODS

    method add(c : Component) -> Done {

        // Check to see if the component is already in the container
        if (!l.contains(c)) then {

            l.push(c)
            hbox.add(c)
        }

    }

    // Removes the component c from this container
    // This sometimes results in the component being destroyed,
    // so make a referece to it before removing if you want to keep it
    method remove(c : Component) {

        var new : List<Component> := []

        for (l) do { other ->

            if (c != other) then {

                new.push(other)
            }
        }

        l := new

        hbox.remove(c.getComponent)
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
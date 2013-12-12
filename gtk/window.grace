import "gtk" as gtk
import "gdk" as gdk
import "Vector2" as vec2
import "canvas" as can
import "components" as comps


type Window = comps.Container & {

    display -> Done

    addCanvas(c : can.Canvas) -> Done

    title -> String
    title:= (t : String) -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    position -> vec2.Vector2
    position:= (p : vec2.Vector2) -> Done

    mouseClicked:= (b : Block) -> Done
    mouseDragged:= (b : Block) -> Done
}


// Wrapper class for a gtk window. Has more readable syntax
class aWindow.new() -> Window {

    // GTK components and values

    // The gtk window object
    def w  = gtk.window(gtk.GTK_WINDOW_TOPLEVEL)

    w.title := "Default Window"
    w.set_default_size(640, 480)


    w.on "destroy" do { gtk.main_quit }

    // The default box for components to be added to.
    def box : comps.Container = comps.aVerticalBox.new

    w.add(box.getComponent)
    box.parent := self


    def accelgroup = gtk.accel_group
    accelgroup.accel_connect(gdk.GDK_KEY_Escape, { gtk.main_quit })

    w.add_accel_group(accelgroup)

    w.add_events(gdk.GDK_BUTTON_PRESS_MASK)
    w.add_events(gdk.GDK_BUTTON1_MOTION_MASK)


    // COMPONENT METHODS

    def ComponentError = Error.refine "Component Error"

    // Window throws an error when trying to get it's parent
    method parent -> comps.Component is override {

        ComponentError.raise "Windows do not have a parent component"
    }

    // Window throws an error when trying to set it's parent
    method parent := (c : comps.Component) -> Done is override {

        ComponentError.raise "Windows do not have a parent component"
    }

    method getComponent {

        w
    }


    // CONTAINER METHODS

    method add(c : comps.Component) -> Done {

        box.add(c)
    }

    method remove(c : comps.Component) -> Boolean {

        box.remove(c)
    }

    method getChildren -> List<comps.Component> {

        [box]
    }




    // WINDOW METHODS

    // Size of this window
    var s : vec2.Vector2 is confidential := vec2.setCoord(640, 480)

    // Displays the window and all components in the window
    // then starts up the gtk main loop.
    // ALWAYS PUT THIS AT THE END OF YOUR CODE
    method display -> Done {

        w.show_all
        gtk.main
    }

    // Return the title of this window
    method title -> String {

        w.title
    }

    // Set the title of this window
    method title:= (t : String) -> Done {

        w.title := t
    }

    // Get the size of this window
    method size -> vec2.Vector2 {

        s
    }

    // Set the size of this window
    method size := (s' : vec2.Vector2) -> Done {

        s := s'
        w.set_size_request(s.x, s.y)
    }

    // Return the position of this window
    method position -> vec2.Vector2 {

        // TODO
    }

    method position:= (p : vec2.Vector2) -> Done {

        // TODO
    }


    // MOUSE EVENTS

    var clickedBlock : Block := {}
    var draggedBlock : Block := {}

    w.on "button-press-event" do { e ->

        clickedBlock.apply(e)
    }

    w.on "motion-notify-event" do { e ->

        draggedBlock.apply(e)
    }

    // Set the clicked block
    method mouseClicked := (b : Block) -> Done {

        clickedBlock := b
    }

    // Set the dragged block
    method mouseDragged := (b : Block) -> Done {

        draggedBlock := b
    }



    // Returns the name of this window as a string
    method asString -> String {

        "Window: {w.title}, Dim: "
    }
}
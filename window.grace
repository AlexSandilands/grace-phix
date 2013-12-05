import "gtk" as gtk
import "gdk" as gdk
import "Vector2" as vec2

type Window = {

    display -> Done

    title -> String
    title:= (t : String) -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    position -> vec2.Vector2
    position:= (p : vec2.Vector2) -> Done


}


// Wrapper class for a gtk window. Has more readable syntax
class aWindow.new() -> Window {

    def w is public = gtk.window(gtk.GTK_WINDOW_TOPLEVEL)

    w.title := "Default Window"
    w.set_default_size(640, 480)


    w.on "destroy" do { gtk.main_quit }

    def accelgroup = gtk.accel_group
    accelgroup.accel_connect(gdk.GDK_KEY_Escape, { gtk.main_quit })

    w.add_accel_group(accelgroup)


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


    // Return the size of this window
    method size -> vec2.Vector2 {

        // TODO
    }

    // Sets the size of this window
    method size:= (s : vec2.Vector2) -> Done {

        w.set_default_size(s.x, s.y)
    }


    // Return the position of this window
    method position -> vec2.Vector2 {

        // TODO
    }

    method position:= (p : vec2.Vector2) -> Done {

        // TODO
    }



    // Returns the name of this window as a string
    method asString -> String {

        "Window: {w.title}, Dim: "
    }
}
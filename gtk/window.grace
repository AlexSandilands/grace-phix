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

    width -> Number
    width:= (w' : Number) -> Done

    height -> Number
    height:= (h' : Number) -> Done

    position -> vec2.Vector2
    position:= (p : vec2.Vector2) -> Done

    mousePressed:=  (b : Block) -> Done
    mouseReleased:= (b : Block) -> Done
    mouseDragged:=  (b : Block) -> Done
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
    w.add_events(gdk.GDK_BUTTON_RELEASE_MASK)
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

    method add(c : comps.Component) -> Boolean {

        box.add(c)
    }

    method addAll(l : List<Component>) -> Boolean {

        box.addAll(l)
    }

    method remove(c : comps.Component) -> Boolean {

        box.remove(c)
    }

    method children -> List<comps.Component> {

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

    // Returns the width of this window
    method width -> Number {

        s.x
    }

    // Set the width of this window
    method width := (w' : Number) -> Done {

        s.x := w'
        w.set_size_request(s.x, s.y)
    }

    // Returns the height of this window
    method height -> Number {

        s.y
    }

    // Set the height of this window
    method height := (h' : Number) -> Done {

        s.y := h'
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

    var pressedBlock  : Block := {}
    var releasedBlock : Block := {}
    var draggedBlock  : Block := {}

    w.on "button-press-event" do { at ->

        pressedBlock.apply(at)
    }

    w.on "button-release-event" do { at ->

        releasedBlock.apply(at)
    }

    w.on "motion-notify-event" do { at ->

        draggedBlock.apply(at)
    }

    // Set the pressed block
    method mousePressed := (b : Block) -> Done {

        pressedBlock := b
    }

    // Set the relesaed block
    method mouseReleased := (b : Block) -> Done {

        releasedBlock := b
    }

    // Set the dragged block
    method mouseDragged := (b : Block) -> Done {

        draggedBlock := b
    }


    // KEY EVENTS

    // Allow the user to enter a string representation of a key and a block
    // which will execute when that key is pressed
    method onKey(key : String) do(b : Block) -> Done {

        match(key)

            case { "a" -> accelgroup.accel_connect(gdk.GDK_KEY_a, b) }
            case { "b" -> accelgroup.accel_connect(gdk.GDK_KEY_b, b) }
            case { "c" -> accelgroup.accel_connect(gdk.GDK_KEY_c, b) }
            case { "d" -> accelgroup.accel_connect(gdk.GDK_KEY_d, b) }
            case { "e" -> accelgroup.accel_connect(gdk.GDK_KEY_e, b) }
            case { "f" -> accelgroup.accel_connect(gdk.GDK_KEY_f, b) }
            case { "g" -> accelgroup.accel_connect(gdk.GDK_KEY_g, b) }
            case { "h" -> accelgroup.accel_connect(gdk.GDK_KEY_h, b) }
            case { "i" -> accelgroup.accel_connect(gdk.GDK_KEY_i, b) }
            case { "j" -> accelgroup.accel_connect(gdk.GDK_KEY_j, b) }
            case { "k" -> accelgroup.accel_connect(gdk.GDK_KEY_k, b) }
            case { "l" -> accelgroup.accel_connect(gdk.GDK_KEY_l, b) }
            case { "m" -> accelgroup.accel_connect(gdk.GDK_KEY_m, b) }
            case { "n" -> accelgroup.accel_connect(gdk.GDK_KEY_n, b) }
            case { "o" -> accelgroup.accel_connect(gdk.GDK_KEY_o, b) }
            case { "p" -> accelgroup.accel_connect(gdk.GDK_KEY_p, b) }
            case { "q" -> accelgroup.accel_connect(gdk.GDK_KEY_q, b) }
            case { "r" -> accelgroup.accel_connect(gdk.GDK_KEY_r, b) }
            case { "s" -> accelgroup.accel_connect(gdk.GDK_KEY_s, b) }
            case { "t" -> accelgroup.accel_connect(gdk.GDK_KEY_t, b) }
            case { "u" -> accelgroup.accel_connect(gdk.GDK_KEY_u, b) }
            case { "v" -> accelgroup.accel_connect(gdk.GDK_KEY_v, b) }
            case { "w" -> accelgroup.accel_connect(gdk.GDK_KEY_w, b) }
            case { "x" -> accelgroup.accel_connect(gdk.GDK_KEY_x, b) }
            case { "y" -> accelgroup.accel_connect(gdk.GDK_KEY_y, b) }
            case { "z" -> accelgroup.accel_connect(gdk.GDK_KEY_z, b) }
            case { "0" -> accelgroup.accel_connect(gdk.GDK_KEY_0, b) }
            case { "1" -> accelgroup.accel_connect(gdk.GDK_KEY_1, b) }
            case { "2" -> accelgroup.accel_connect(gdk.GDK_KEY_2, b) }
            case { "3" -> accelgroup.accel_connect(gdk.GDK_KEY_3, b) }
            case { "4" -> accelgroup.accel_connect(gdk.GDK_KEY_4, b) }
            case { "5" -> accelgroup.accel_connect(gdk.GDK_KEY_5, b) }
            case { "6" -> accelgroup.accel_connect(gdk.GDK_KEY_6, b) }
            case { "7" -> accelgroup.accel_connect(gdk.GDK_KEY_7, b) }
            case { "8" -> accelgroup.accel_connect(gdk.GDK_KEY_8, b) }
            case { "9" -> accelgroup.accel_connect(gdk.GDK_KEY_9, b) }
            case { "-" -> accelgroup.accel_connect(gdk.GDK_KEY_minus, b) }
            case { "=" -> accelgroup.accel_connect(gdk.GDK_KEY_equal, b) }
            case { "!" -> accelgroup.accel_connect(gdk.GDK_KEY_exclam, b) }
            case { "@" -> accelgroup.accel_connect(gdk.GDK_KEY_at, b) }
            case { "#" -> accelgroup.accel_connect(gdk.GDK_KEY_numbersign, b) }
            case { "$" -> accelgroup.accel_connect(gdk.GDK_KEY_dollar, b) }
            case { "%" -> accelgroup.accel_connect(gdk.GDK_KEY_percent, b) }
            case { "^" -> accelgroup.accel_connect(gdk.GDK_KEY_caret, b) }
            case { "&" -> accelgroup.accel_connect(gdk.GDK_KEY_ampersand, b) }
            case { "*" -> accelgroup.accel_connect(gdk.GDK_KEY_asterisk, b) }
            case { "(" -> accelgroup.accel_connect(gdk.GDK_KEY_parenleft, b) }
            case { ")" -> accelgroup.accel_connect(gdk.GDK_KEY_parenright, b) }
            case { "," -> accelgroup.accel_connect(gdk.GDK_KEY_comma, b) }
            case { "." -> accelgroup.accel_connect(gdk.GDK_KEY_period, b) }
            case { "/" -> accelgroup.accel_connect(gdk.GDK_KEY_slash, b) }
            case { "<" -> accelgroup.accel_connect(gdk.GDK_KEY_less, b) }
            case { ">" -> accelgroup.accel_connect(gdk.GDK_KEY_greater, b) }
            case { "?" -> accelgroup.accel_connect(gdk.GDK_KEY_question, b) }
            case { ";" -> accelgroup.accel_connect(gdk.GDK_KEY_semicolon, b) }
            case { "\'" -> accelgroup.accel_connect(gdk.GDK_KEY_', b) }
            case { ":" -> accelgroup.accel_connect(gdk.GDK_KEY_colon, b) }
            case { "\"" -> accelgroup.accel_connect(gdk.GDK_KEY_quotedbl, b) }
            case { "[" -> accelgroup.accel_connect(gdk.GDK_KEY_bracketleft, b) }
            case { "]" -> accelgroup.accel_connect(gdk.GDK_KEY_bracketright, b) }
            case { "\{" -> accelgroup.accel_connect(gdk.GDK_KEY_braceleft, b) }
            case { "\}" -> accelgroup.accel_connect(gdk.GDK_KEY_braceright, b) }
            case { "\\" -> accelgroup.accel_connect(gdk.GDK_KEY_backslash, b) }
            case { "|" -> accelgroup.accel_connect(gdk.GDK_KEY_bar, b) }
            case { "F1" -> accelgroup.accel_connect(gdk.GDK_KEY_F1, b) }
            case { "F2" -> accelgroup.accel_connect(gdk.GDK_KEY_F2, b) }
            case { "F3" -> accelgroup.accel_connect(gdk.GDK_KEY_F3, b) }
            case { "F4" -> accelgroup.accel_connect(gdk.GDK_KEY_F4, b) }
            case { "F5" -> accelgroup.accel_connect(gdk.GDK_KEY_F5, b) }
            case { "F6" -> accelgroup.accel_connect(gdk.GDK_KEY_F6, b) }
            case { "F7" -> accelgroup.accel_connect(gdk.GDK_KEY_F7, b) }
            case { "F8" -> accelgroup.accel_connect(gdk.GDK_KEY_F8, b) }
            case { "F9" -> accelgroup.accel_connect(gdk.GDK_KEY_F9, b) }
            case { "F10" -> accelgroup.accel_connect(gdk.GDK_KEY_F10, b) }
            case { "F11" -> accelgroup.accel_connect(gdk.GDK_KEY_F11, b) }
            case { "F12" -> accelgroup.accel_connect(gdk.GDK_KEY_F12, b) }
            case { "`" -> accelgroup.accel_connect(gdk.GDK_KEY_grave, b) }
            case { "~" -> accelgroup.accel_connect(gdk.GDK_KEY_asciitilde, b) }
            case { "space" -> accelgroup.accel_connect(gdk.GDK_KEY_space, b) }
            case { "delete" -> accelgroup.accel_connect(gdk.GDK_KEY_Delete, b) }
            case { "backspace" -> accelgroup.accel_connect(gdk.GDK_KEY_BackSpace, b) }
            case { "home" -> accelgroup.accel_connect(gdk.GDK_KEY_Home, b) }
            case { "end" -> accelgroup.accel_connect(gdk.GDK_KEY_End, b) }
            case { "page_up" -> accelgroup.accel_connect(gdk.GDK_KEY_Page_Up, b) }
            case { "page_down" -> accelgroup.accel_connect(gdk.GDK_KEY_Page_Down, b) }






            // How to get capital letters


            // Can I override previous connections?
            case { "escape" -> accelgroup.accel_connect(gdk.GDK_KEY_Escape, b) }


            // There is probably some focus issues with these keys
            case { "up" -> accelgroup.accel_connect(gdk.GDK_KEY_Up, b) }
            case { "down" -> accelgroup.accel_connect(gdk.GDK_KEY_Down, b) }
            case { "left" -> accelgroup.accel_connect(gdk.GDK_KEY_Left, b) }
            case { "right" -> accelgroup.accel_connect(gdk.GDK_KEY_Right, b) }


            case { "return" -> accelgroup.accel_connect(gdk.GDK_KEY_Return, b) }
            case { "left_alt" -> accelgroup.accel_connect(gdk.GDK_KEY_Alt_L, b) }
            case { "right_alt" -> accelgroup.accel_connect(gdk.GDK_KEY_Alt_R, b) }
            case { "tab" -> accelgroup.accel_connect(gdk.GDK_KEY_Tab, b) }
            case { "left_ctrl" -> accelgroup.accel_connect(gdk.GDK_KEY_Control_L, b) }
            case { "right_ctrl" -> accelgroup.accel_connect(gdk.GDK_KEY_Control_R, b) }





            case { _ -> print "Did not match a keypress." }
    }




    // Returns the name of this window as a string
    method asString -> String {

        "Window: {w.title}, Dim: {s}"
    }
}
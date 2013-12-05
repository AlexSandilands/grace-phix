import "gtk" as gtk
import "gdk" as gdk
import "window" as win
import "Vector2" as vec2



// ---------------------------------- //
//                                    //
//           WINDOW METHODS           //
//                                    //
// ---------------------------------- //



// Creates and returns a window object, which contains a gtk window
// with a bunch of default values for title and size etc
method createWindow -> win.Window {

    return win.aWindow.new
}

// Creates and returns a default window at the position passed in
method createWindowAt(x : Number, y : Number) -> win.Window {

    var ret := win.aWindow.new
    ret.setPosition(vec2.setCoord(x, y))

    return ret
}

// Creates and returns a window at the specified position with the
// specified size
method createWindowAt(x : Number, y : Number)
       withSize(w : Number, h : Number) -> win.Window {

    var ret := win.aWindow.new
    ret.setPosition(vec2.setCoord(x, y))
    ret.setSize(vec2.setCoord(w, h))

    return ret
}

// Creates and returns a window with the specified size
method createWindowWithSize(w : Number, h : Number) -> win.Window {

    var ret := win.aWin.new
    ret.setSize(vec2.setCoord(w, h))

    return ret
}

// Creates a window with name, position and size specified
method createWindowCalled(t : String)
       at(x : Number, y : Number)
       withSize(w : Number, h : Number) -> win.Window{

    var ret := win.aWindow.new
    ret.setTitle(t)
    ret.setPosition(vec2.setCoord(x, y))
    ret.setSize(vec2.setCoord(w, h))

    return ret
}


// ============================================================================
// ============================================================================


// ---------------------------------- //
//                                    //
//           CANVAS METHODS           //
//                                    //
// ---------------------------------- //




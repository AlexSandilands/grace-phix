import "gtk" as gtk
import "gdk" as gdk

import "drawable" as draw
import "components" as comps

import "Vector2" as vec2
import "Color" as col
import "GMath" as math

// Canvas component.
// This component is a display buffer. It contains a list of drawable objects
// which get painted to the buffer and can be manipulated.
// Dispite appearing to have similar methods as a container, it is not as it
// doesn't contain components, only drawables.
// The canvas can have external drawables objects added to it, or it can create
// it's own basic drawables directly.
type Canvas = comps.Component & type {

    add(d : draw.Drawable) -> Boolean
    addAll(l : List<draw.Drawable>) -> Boolean

    remove(d : draw.Drawable) -> Boolean
    removeWithIndex(ind : Number) -> Boolean

    getWithIndex(ind : Number) -> draw.Drawable
    findDrawableAt(x : Number, y : Number) -> Number

    sendToBack(d : draw.Drawable) -> Done
    sendIndexToBack(ind : Number) -> Done

    bringToFront(d : draw.Drawable) -> Done
    bringIndexToFront(ind : Number) -> Done

    sendBack(d : draw.Drawable) -> Done
    sendIndexBack(ind : Number) -> Done

    bringForward(d : draw.Drawable) -> Done
    bringIndexForward(ind : Number) -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    width -> Number
    width:= (w' : Number) -> Done

    height -> Number
    height:= (h' : Number) -> Done

    paintable -> Boolean
    paintable:= (b : Boolean) -> Done
    paint -> Done

    asString -> String

    // Drawing methods

    color -> col.Color
    color:= (c : col.Color) -> Done

    fill  -> Boolean
    fill:= (b : Boolean) -> Done

    mousePressed:=  (b : Block) -> Done
    mouseReleased:= (b : Block) -> Done
    mouseClicked:=  (b : Block) -> Done


    drawRectangleAt(x : Number, y : Number) sized(w : Number, h : Number) -> draw.Drawable

    drawCircleAround(x : Number, y : Number) radius(r : Number) -> draw.Drawable

    drawOvalAt(x : Number, y : Number) sized(w : Number, h : Number) -> draw.Drawable

    drawSectorAround(x : Number, y : Number)
                from(f : Number)
                  to(t : Number)
              radius(r : Number) -> draw.Drawable

    drawArcAround(x : Number, y : Number)
             from(f : Number)
               to(t : Number)
           radius(r : Number)
            width(w : Number) -> draw.Drawable

    drawLineFrom(x1 : Number, y1 : Number) to(x2 : Number, y2 : Number) -> draw.Drawable

    drawLineAt(x : Number, y : Number) length(l : Number) angle(a : Number) -> draw.Drawable

    drawTextSaying(t : String) at(x : Number, y : Number) -> draw.Drawable

    drawImageAt(x : Number, y : Number)
          sized(w : Number, h : Number)
           from(path : String) -> draw.Drawable

}


class aCanvas.new -> Canvas {

    // GTK components for this canvas
    def c = gtk.drawing_area
    c.set_size_request(640, 480)
    c.app_paintable := true
    c.add_events(gdk.GDK_BUTTON_PRESS_MASK)
    c.add_events(gdk.GDK_BUTTON_RELEASE_MASK)
    c.add_events(gdk.GDK_POINTER_MOTION_MASK)
    c.add_events(gdk.GDK_ENTER_NOTIFY_MASK)
    c.add_events(gdk.GDK_LEAVE_NOTIFY_MASK)



    // What to do when the canvas is requested to paint
    c.on "draw" do { gfx ->

        for (drawables) do { d ->

            d.draw(gfx)
        }

    }


    // COMPONENT METHODS

    var parent : comps.Component is public

    // Get the gtk component for this canvas
    method getComponent {

        c
    }


    // CANVAS METHODS

    var drawables : List<draw.Drawable> := []

    // Size of the canvas
    // First component is width, second is height
    var s : vec2.Vector2 := vec2.x(640) y(480)

    // Whether this canvas is able to paint objects
    var p : Boolean := true

    // Adds a drawable object d to the canvas.
    // The same drawable object cannot be added more than once,
    // so clone it before adding a new one.
    // A set could work here, but it would make the ordering methods
    // much more complicated. Lists are also very readable
    method add(d : draw.Drawable) -> Boolean {

        if (drawables.contains(d)) then {

            return false

        } else {

            drawables.push(d)
            return true
        }
    }

    // Adds the list l of drawables to the canvas.
    // If one of the drawables is already on the canvas then the method
    // will break and return false, with the rest of the drawables in l
    // not being added.
    method addAll(l : List<draw.Drawable>) -> Boolean {

        for (l) do { d ->

            if (drawables.contains(d)) then {

                return false

            } else {

                drawables.push(d)
            }
        }

        return true
    }

    // Remove the drawable d from the canvas.
    // Returns true if one instance was found and removed, or false otherwise.
    method remove(d : draw.Drawable) -> Boolean {

        var new : List<draw.Drawable> := []

        // Add every drawable in the list to a new list, apart
        //from the drawable being removed.
        for (drawables) do { other ->

            if (d != other) then {

                new.push(other)
            }
        }

        // If the original list and new list have the same size
        // then nothing was removed
        if (drawables.size == new.size) then {

            return false

        // Otherwise something was removed, so set the new list and return true
        } else {

            drawables := new

            return true
        }
    }

    // Removes the drawable at the index ind.
    // Returns false if the index was out of bounds.
    method removeWithIndex(ind : Number) -> Boolean {

        // Check that the index in within bounds
        if ((ind < 1) && (drawables.length < ind)) then {

            return false

        } else {

            var new : List<draw.Drawable> := []

            // Add every drawable apart from the one at the passed index
            // to a new list
            for (1 .. drawables.size) do { i ->

                if (i != ind) then {

                    new.push(drawables[i])
                }
            }

            // Set the new list
            drawables := new

            return true
        }


    }

    // Returns the drawable at index ind
    method getWithIndex(ind : Number) -> draw.Drawable {

        drawables[ind]
    }

    // Returns the index of the top drawable that contains (x, y) or
    // 0 if none are found. Note that it searchs from the end of the list
    // to the beggining of the list, as when painting the canvas paints from
    // the start of the list.
    method findDrawableAt(x : Number, y : Number) -> Number {

        def size = drawables.size

        for (1 .. size) do { i ->

            if (drawables[size + 1 - i].contains(x, y)) then {

                return size + 1 - i
            }
        }

        return 0
    }

    // Sends the drawable d to the back of the display buffer
    method sendToBack(d : draw.Drawable) -> Done {

        // If d has been found in the list
        var found := false

        // Create a new list with d at the beggining (at the back of the buffer)
        var newList : List<draw.Drawable> := [d]

        // Add all drawables other than d to the end of then new list
        for (drawables) do { other ->

            if (other == d) then {

                found := true

            } else {

                newList.push(other)
            }
        }

        // If d was found then set the new list to be the list of drawables.
        if (found) then {

            drawables := newList
        }
    }

    // Sends the drawable at index ind to the back of the display buffer
    method sendIndexToBack(ind : Number) -> Done {

        // Create a new list with the drawable at index ind at the beggining
        var newList : List<draw.Drawable> := [drawables[ind]]

        // Add all drawables other than the one at index ind to the new list
        for (1 .. drawables.size) do { i ->

            if (i != ind) then {

                newList.push(drawables[i])
            }
        }

        // Set the new list to be the list of drawables.
        // Note that a bounds error would have been thrown already before
        // this point if ind was not in the list, so this is safe.
        drawables := newList
    }

    // Brings the drawable d to the front of the display buffer
    method bringToFront(d : draw.Drawable) -> Done {

        var found := false

        // Create an empty list. d will be added to the end of this when
        // all other drawables have been added
        var newList : List<draw.Drawable> := []

        // Add all drawables other than d to the new list
        for (drawables) do { other ->

            if (other != d) then {

                newList.push(other)

            } else {

                found := true
            }
        }

        // If d was in the drawables list, add it add the end of the new list
        // and set that as the new drawables list
        if (found) then {

            newList.push(d)
            drawables := newList
        }
    }

    // Brings the drawable at the index ind to the front of the display buffer
    method bringIndexToFront(ind : Number) -> Done {

        var d : draw.Drawable := drawables[ind]

        // Create an empty list. The drawable at index ind will be added
        // at the end of this when all other drawables have been added
        var newList : List<draw.Drawable> := []

        // Add all drawables other than the one at index ind
        for (1 .. drawables.size) do { i ->

            if (i != ind) then {

                newList.push(drawables[i])
            }
        }

        newList.push(d)

        // Set the new list to be the list of drawables.
        // Note that a bounds error would have been thrown already before
        // this point if ind was not in the list, so this is safe.
        drawables := newList
    }

    // Sends the drawable d back one position in the draw order
    method sendBack(d : draw.Drawable) -> Done {

        // Search for d from position 2. If it was at position 1
        // it wouldn't need to be changed
        for (2 .. drawables.size) do { i ->

            // If d is found, switch it with the drawable one index before it
            if (drawables[i] == d) then {

                var temp := drawables[i - 1]
                drawables[i - 1] := d
                drawables[i] := temp
            }
        }
    }

    // Sends the drawable at index ind back one position in the draw order
    method sendIndexBack(ind : Number) -> Done {

        if (ind != 1) then {

            // Switch ind and ind - 1
            var temp := drawables[ind - 1]
            drawables[ind - 1] := drawables[ind]
            drawables[ind] := temp
        }
    }

    // Brings the drawable d forward one position in the draw order
    method bringForward(d : draw.Drawable) -> Done {

        // var found := false

        // Search for d from position 1 up to the second to last drawable.
        // If it was at the end it wouldn't need to be changed
        for (1 .. (drawables.size - 1)) do { i ->

            // If d is found switch it with the drawable one position after it
            if (drawables[i] == d) then {

                var temp := drawables[i + 1]
                drawables[i + 1] := d
                drawables[i] := temp
                // found := true

                // Return now because otherwise d would get switched all
                // the way to the top of the list
                return Done
            }
        }
    }

    // Brings the drawable at index ind forward one position in the draw order
    method bringIndexForward(ind : Number) -> Done {

        if (ind != drawables.size) then {

            // Switch ind and ind + 1
            var temp := drawables[ind + 1]
            drawables[ind + 1] := drawables[ind]
            drawables[ind] := temp
        }
    }


    // Gets the size of this canvas as a 2d Vector
    // First component is width, second is height
    method size -> vec2.Vector2 {

        s
    }

    // Sets the size of this canvas with a 2d Vector s'
    // First component is width, second is height
    method size := (s' : vec2.Vector2) -> Done {

        s := s'

        c.set_size_request(s.x, s.y)
    }

    // Returns the width of this canvas
    method width -> Number {

        s.x
    }

    // Set the width of this canvas
    method width := (w' : Number) -> Done {

        s.x := w'

        c.set_size_request(s.x, s.y)
    }

    // Returns the height of this canvas
    method height -> Number {

        s.y
    }

    // Set the height of this canvas
    method height := (h' : Number) -> Done {

        s.y := h'

        c.set_size_request(s.x, s.y)
    }

    // Returns whether this canvas is able to paint objects
    method paintable -> Boolean {

        p
    }

    // Set whether this canvas can actually paint things. True by default
    method paintable:= (b : Boolean) {

        p := b
        c.app_paintable := b
    }

    // Asks the canvas to repaint
    method paint -> Done {

        c.queue_draw
    }

    // Returns a string representation of this canvas
    method asString -> String {

        "Canvas, Dimension: {s}, Number of drawables: {drawables.size}"
    }



    // ---------------------------- //
    //                              //
    //         DRAW METHODS         //
    //                              //
    // ---------------------------- //


    // The color that objects will be drawn with if using the canvas draw methods
    var color : col.Color is public := col.black

    // Defines whether or not the shapes drawn by the canvas will be filled
    var fill : Boolean is public := true


    // MOUSE EVENTS

    var mouseDown := false

    var pressedBlock  : Block := {}
    var releasedBlock : Block := {}
    var draggedBlock  : Block := {}
    var motionBlock   : Block := {}
    var enterBlock    : Block := {}
    var leaveBlock    : Block := {}

    c.on "button-press-event" do { at ->

        mouseDown := true
        pressedBlock.apply(at)
    }

    c.on "button-release-event" do { at ->

        mouseDown := false
        releasedBlock.apply(at)
    }

    c.on "motion-notify-event" do { at ->

        if (mouseDown) then {

            draggedBlock.apply(at)

        } else {

            motionBlock.apply(at)
        }
    }

    c.on "enter-notify-event" do { at ->

        enterBlock.apply(at)
    }

    c.on "leave-notify-event" do { at ->

        leaveBlock.apply(at)
    }

    // Set what happens when you press the mouse button on the canvas
    method mousePressed := (b : Block) -> Done {

        pressedBlock := b
    }

    // Set what happens when you release the mouse button on the canvas
    method mouseReleased := (b : Block) -> Done {

        releasedBlock := b
    }

    // Set what happens when you drag the mouse on the canvas
    method mouseDragged := (b : Block) -> Done {

        draggedBlock := b
    }

    // Set what happens when you move the mouse on the canvas
    method mouseMotion := (b : Block) -> Done {

        motionBlock := b
    }

    // Set what happens when the mouse enters the canvas
    method mouseEnter := (b : Block) -> Done {

        enterBlock := b
    }

    // Set what happens when the mouse leaves the canvas
    method mouseLeave := (b : Block) -> Done {

        leaveBlock := b
    }


    // RECTANGLES

    // Rectangle at (x, y) sized wxh colored c
    method drawRectangleAt(x : Number, y : Number)
                     sized(w : Number, h : Number) -> draw.Drawable {


        var shape := draw.aRectangle.at(vec2.x(x)y(y))
                                   sized(vec2.x(w)y(h))
                                 colored(color)

        shape.fill := fill

        drawables.push(shape)

        return shape
    }


    // CIRCLES

    // Circle around (x, y) radius r colored c
    method drawCircleAround(x : Number, y : Number) radius(r : Number) -> draw.Drawable {

        var shape := draw.aCircle.around(vec2.x(x) y(y)) radius(r) colored(color)

        shape.fill := fill

        drawables.push(shape)

        return shape
    }


    // Oval around (x, y) size wxh colored c
    method drawOvalAt(x : Number, y : Number)
                sized(w : Number, h : Number) -> draw.Oval {


        var shape := draw.aOval.at (vec2.x(x) y(y))
                             sized (vec2.x(w) y(h))
                           colored (color)

        shape.fill := fill

        drawables.push(shape)

        return shape
    }

    // SECTORS

    // Sector around (x, y) radius r from f to t colored c
    method drawSectorAround(x : Number, y : Number)
                       from(f : Number)
                         to(t : Number)
                     radius(r : Number) -> draw.Drawable {

        var shape := draw.aSector.around(vec2.x(x) y(y))
                                    from(f)
                                      to(t)
                                  radius(r)
                                 colored(color)

        shape.fill := fill

        drawables.push(shape)

        return shape
    }


    // ARCS

    // Arc around (x, y) radius r width w from f to t colored c
    method drawArcAround(x : Number, y : Number)
                    from(f : Number)
                      to(t : Number)
                  radius(r : Number)
                   width(w : Number) -> draw.Drawable {

        var shape := draw.aArc.around(vec2.x(x) y(y))
                                 from(f)
                                   to(t)
                               radius(r)
                                width(w)
                              colored(color)

        shape.fill := fill

        drawables.push(shape)

        return shape
    }


    // LINE

    // Line from (x1, y1) to (x2, y2) colored b
    method drawLineFrom(x1 : Number, y1 : Number) to(x2 : Number, y2 : Number) -> draw.Drawable {

        var shape := draw.aLine.from (vec2.x(x1) y(y1))
                                  to (vec2.x(x2) y(y2))
                             colored (color)

        drawables.push(shape)

        return shape
    }

    // Line at (x, y) with length l and anti-clockwise angle a in radians
    method drawLineAt(x : Number, y : Number) length(l : Number) angle(a : Number) -> draw.Drawable {

        // Calculate the horizontal and vertical distances to the end point
        def xLen = math.cos(a)*l
        def yLen = math.sin(a)*l

        var shape

        // First quarter of complex plane
        if (a < math.half_pi) then {

            shape := draw.aLine.from(vec2.x(x) y(y))
                                   to(vec2.x(x + xLen) y(y - yLen))
                              colored(color)

        // Second quarter of complex plane
        } elseif (a < math.pi) then {

            shape := draw.aLine.from(vec2.x(x) y(y))
                                   to(vec2.x(x - xLen) y(y - yLen))
                              colored(color)

        // Third quarter of complex plane
        } elseif (a < ((3*math.pi)/2)) then {

            shape := draw.aLine.from(vec2.x(x) y(y))
                                   to(vec2.x(x - xLen) y(y + yLen))
                              colored(color)

        // Last quarter of complex plane
        } else {

            shape := draw.aLine.from(vec2.x(x) y(y))
                                   to(vec2.x(x + xLen) y(y + yLen))
                              colored(color)
        }

        drawables.push(shape)

        return shape
    }


    // TEXT

    // Text saying t at (x, y) colored c
    method drawTextSaying(t : String) at(x : Number, y : Number) -> draw.Drawable {

        var shape := draw.aText.write(t) at(vec2.x(x) y(y)) colored(color)

        drawables.push(shape)

        return shape
    }


    // IMAGE

    // Image at (x, y) sized wxh from file: path
    method drawImageAt(x : Number, y : Number)
                 sized(w : Number, h : Number)
                  from(path : String) -> draw.Drawable {

        var shape := draw.aImage.at(vec2.x(x) y(y)) sized(vec2.x(w) y(h)) from(path)

        drawables.push(shape)

        return shape
    }

}
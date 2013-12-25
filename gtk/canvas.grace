import "gtk" as gtk
import "gdk" as gdk

import "drawable" as draw
import "components" as comps

import "Vector2" as vec2
import "Color" as col
import "Math" as math


type Canvas = comps.Component & {

    drawables -> List<draw.Drawable>

    add(d : draw.Drawable) -> Done
    addAll(l : List<draw.Drawable>) -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    width -> Number
    width:= (w' : Number) -> Done

    height -> Number
    height:= (h' : Number) -> Done

    setPaintable(b : Boolean) -> Done
    paint -> Done

    mousePressed:=  (b : Block) -> Done
    mouseReleased:= (b : Block) -> Done
    mouseClicked:=  (b : Block) -> Done
}


class aCanvas.new -> Canvas {

    // GTK components for this canvas
    def c = gtk.drawing_area
    c.set_size_request(640, 480)
    c.app_paintable := true
    c.add_events(gdk.GDK_BUTTON_PRESS_MASK)
    c.add_events(gdk.GDK_BUTTON_RELEASE_MASK)
    c.add_events(gdk.GDK_BUTTON1_MOTION_MASK)


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
    var s : vec2.Vector2 is confidential := vec2.setCoord(640, 480)

    // Adds a drawable object to the canvas
    method add(d : draw.Drawable) -> Done {

        drawables.push(d)
    }

    // Add a list of drawables to the canvas
    method addAll(l : List<draw.Drawable>) -> Done {

        for (l) do { d ->

            drawables.push(d)
        }
    }

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

    // Returns the drawable that has the passed in index
    method getWithIndex(ind : Number) -> draw.Drawable {

        drawables[ind]
    }

    // Returns the index of the top drawable that contains (x', y') or
    // 0 if none are found
    method findDrawableAt(x' : Number, y' : Number) -> Number {

        def size = drawables.size

        for (1 .. size) do { i ->

            if (drawables[size + 1 - i].contains(x', y')) then {

                return size + 1 - i
            }
        }

        return 0
    }

    // Gets the size of this canvas as a 2d Vector
    method size -> vec2.Vector2 {

        s
    }

    // Sets the size of this canvas with a 2d Vector
    method size := (s' : vec2.Vector2) -> Done {

        s := s'
        c.set_size_request(s.x, s.y)
    }

    // Set the width of this canvas
    method width := (w' : Number) -> Done {

        s.x := w'
        c.set_size_request(s.x, s.y)
    }

    // Set the height of this canvas
    method height := (h' : Number) -> Done {

        s.y := h'
        c.set_size_request(s.x, s.y)
    }

    method setPaintable(b : Boolean) {

        c.app_paintable := b
    }

    method paint -> Done {

        c.queue_draw
    }


    method asString -> String {

        return "Canvas, Dim: {s}"
    }



    // ---------------------------- //
    //                              //
    //         DRAW METHODS         //
    //                              //
    // ---------------------------- //


    // Color that objects will be drawn with if using the canvas draw methods
    var color : col.Color is public := col.black

    // Defines whether or not the shapes drawn by the canvas will be filled
    var fill : Boolean is public := true


    // MOUSE EVENTS

    var pressedBlock  : Block := {}
    var releasedBlock : Block := {}
    var draggedBlock  : Block := {}

    c.on "button-press-event" do { at ->

        pressedBlock.apply(at)
    }

    c.on "button-release-event" do { at ->

        releasedBlock.apply(at)
    }

    c.on "motion-notify-event" do { at ->

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



    // RECTANGLES

    // Rectangle at (x, y) sized wxh colored c
    method drawRectangleAt(x : Number, y : Number)
                     sized(w : Number, h : Number) -> Done {


        var shape := draw.aRectangle.at(vec2.setCoord(x, y))
                                   sized(vec2.setCoord(w, h))
                                 colored(color)

        shape.fill := fill

        drawables.push(shape)
    }


    // CIRCLES

    // Circle around (x, y) radius r colored c
    method drawCircleAround(x : Number, y : Number) radius(r : Number) -> Done {

        var shape := draw.aCircle.around(vec2.setCoord(x, y)) radius(r) colored(color)

        shape.fill := fill

        drawables.push(shape)
    }


    // Oval around (x, y) size wxh colored c
    method drawOvalAt(x : Number, y : Number)
                sized(w : Number, h : Number) -> draw.Oval {


        var shape := draw.aOval.at (vec2.setCoord(x, y))
                             sized (vec2.setCoord(w, h))
                           colored (color)

        shape.fill := fill

        drawables.push(shape)
    }

    // SECTORS

    // Sector around (x, y) radius r from f to t colored c
    method drawSectorAround(x : Number, y : Number)
                       from(f : Number)
                         to(t : Number)
                     radius(r : Number) -> Done {

        var shape := draw.aSector.around(vec2.setCoord(x, y))
                                    from(f)
                                      to(t)
                                  radius(r)
                                 colored(color)

        shape.fill := fill

        drawables.push(shape)
    }


    // ARCS

    // Arc around (x, y) radius r width w from f to t colored c
    method drawArcAround(x : Number, y : Number)
                    from(f : Number)
                      to(t : Number)
                  radius(r : Number)
                   width(w : Number) -> Done {

        var shape := draw.aArc.around(vec2.setCoord(x, y))
                                 from(f)
                                   to(t)
                               radius(r)
                                width(w)
                              colored(color)

        shape.fill := fill

        drawables.push(shape)
    }


    // LINE

    // Line from (x1, y1) to (x2, y2) colored b
    method drawLineFrom(x1 : Number, y1 : Number) to(x2 : Number, y2 : Number) -> Done {


        drawables.push(

            draw.aLine.from (vec2.setCoord(x1, y1))
                         to (vec2.setCoord(x2, y2))
                    colored (color)
        )
    }


    // TEXT

    // Text saying t at (x, y) colored c
    method drawTextSaying(t : String) at(x : Number, y : Number) -> Done {

        drawables.push(

            draw.aText.write(t) at(vec2.setCoord(x, y)) colored(color)
        )
    }


    // IMAGE

    // Image at (x, y) sized wxh from file: path
    method drawImageAt(x : Number, y : Number)
                 sized(w : Number, h : Number)
                  from(path : String) -> Done {


        drawables.push(

            draw.aImage.at(vec2.setCoord(x, y)) sized(vec2.setCoord(w, h)) from(path)
        )

    }

}
import "gtk" as gtk
import "gdk" as gdk

import "drawable" as draw
import "components" as comps

import "Vector2" as vec2
import "Color" as col
import "Math" as math


type Canvas = comps.Component & {

    addDrawable -> Done

    size -> vec2.Vector2
    size:= (s : vec2.Vector2) -> Done

    setPaintable(b : Boolean) -> Done
    paint -> Done

}


class aCanvas.new -> Canvas {

    // GTK components for this canvas
    def c = gtk.drawing_area
    c.set_size_request(640, 480)
    c.app_paintable := true
    c.add_events(gdk.GDK_BUTTON_PRESS_MASK)
    c.add_events(gdk.GDK_BUTTON1_MOTION_MASK)


    def drawables : List<draw.Drawable> is confidential = []


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

    var s : vec2.Vector2 is confidential := vec2.setCoord(640, 480)

    // Adds a drawable object to the canvas
    method add(d : draw.Drawable) -> Done {

        drawables.push(d)
    }

    // Sets the size of this canvas
    method size -> vec2.Vector2 {

        s
    }

    method size := (s' : vec2.Vector2) -> Done {

        s := s'
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

    var clickedBlock : Block := {}
    var draggedBlock : Block := {}

    c.on "button-press-event" do { e ->

        clickedBlock.apply(e)
    }

    c.on "motion-notify-event" do { e ->

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
                           colored (col.black)

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
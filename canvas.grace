import "gtk" as gtk
import "gdk" as gdk
import "Vector2" as Vector2

class Canvas.new {

    def c is confidential = gtk.drawing_area
    c.app_paintable := true

    def drawables is confidential = []

    c.on "draw" do { c ->

        for (drawables) do { d ->

            c.set_source_rgb(d.)
        }

    }


    method asString -> String {

        return "Canvas, Dim: "
    }

    // Sets the size of this canvas
    method setSize(s : Vector2) -> Done {

        c.set_size_request(s.x, s.y)
    }

    method getCanvas {

        return c
    }

    method setPaintable(b : Boolean) {

        c.app_paintable := b
    }

    method paint -> Done {

        c.queue_draw
    }

}
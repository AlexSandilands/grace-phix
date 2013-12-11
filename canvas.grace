import "gtk" as gtk
import "gdk" as gdk
import "Vector2" as vec2
import "drawable" as draw
import "components" as comps


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


    def drawables : List<draw.Drawable> is confidential = []


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
}
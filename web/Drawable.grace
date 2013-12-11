import "dom" as dom
import "Vector2" as vec2

//Drawable Type
type Drawable = {

    //VARIABLES
    //the position
    pos -> vec2.Vector2
    //the color
    color -> String

    //PUBLIC METHODS
    //Draws the drawable
    draw(context) -> Done

    //returns the position
    getPos -> vec2.Vector2
    //returns the colour
    getColor -> String
    //sets the position
    setPos(pos' : vec2.Vector2) -> Done
    //sets the color
    setColor(color' : String) -> Done

}

//Rectangle Type
type Rectangle = Drawable & {

    //VARIABLES
    //the dimensions
    dim -> vec2.Vector2

    //PUBLIC METHODS
    //returns the dimensions
    getDim -> vec2.Vector2
    //sets the dimensions
    setDim(dim' : vec2.Vector2) -> Done
}

//Rectangle class
//pos' : the position
//dim' : the dimensions
//color' : the color
class aRectangle.new(pos' : vec2.Vector2, dim' : vec2.Vector2, color' : String) {

    //VARIABLES
    var pos := pos'
    var dim := dim'
    var color := color'

    //METHODS
    //draws the rectangle
    method draw(context) -> Done {

        context.fillStyle := color
        context.fillRect(pos.x, pos.y, dim.x, dim.y)
    }

    //GETTERS
    //returns the position
    method getPos -> vec2.Vector2 {

        return pos
    }

    //returns the dimensions
    method getDim -> vec2.Vector2 {

        return dim
    }


    //returns the colour
    method getColor -> String {

        return color
    }

    //SETTERS
    //sets the position
    method setPos(pos' : vec2.Vector2) -> Done {

        pos := pos'
    }

    //sets the dimensions
    method setDim(dim' : vec2.Vector2) -> Done {

        dim := dim'
    }

    //sets the color
    method setColor(color' : String) -> Done {

        color := color'
    }
}
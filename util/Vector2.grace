//CONSTRUCTOR METHODS
//creates a new zero 2d vector
method zero -> Vector2 {

    Vector2.new(0, 0)
}

//creates a new 2d vector and initialises it with the given x and y values
method setCoords(x : Number, y : Number) -> Vector2 {

    Vector2.new(x, y)
}

//creates a new 2d vector and initialises it with the values of the given
//2d vector
method setVector2(v : Vector2) -> Vector2 {

    Vector2.new(v.x, v.y)
}

//creates a new 2d vector and initialises it with the x and y values of the
//given 3d vector and truncates the z value
method setVector3(v : Vector3) -> Vector2 {

    Vector2.new(v.x, v.y)
}

//creates a new 2d vector and initialises it with the x and y values of the
//given 4d vector and truncates the z and w values
method setVector4(v : Vector4) -> Vector2 {

    Vector2.new(v.x, v.y)
}

//creates a new 2d vector initialised with x: 1, y: 0
method xAxis -> Vector2 {

    Vector2.new(1, 0);
}

//creates a new 2d vector initialised with x: 0, y: 1
method yAxis -> Vector2 {

    Vector2.new(0, 1);
}

//VECTOR2 CLASS
//constructs a new 2d vector with the given x' and y' values
class Vector2.new(x' : Number, y' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'

    //PUBLIC METHODS
    method asString -> String is public {

        "[" ++ x ++ ", " ++ y ++ "]"
    }
}
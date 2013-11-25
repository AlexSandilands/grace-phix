//CONSTRUCTOR METHODS
//creates a new zero 3d vector
method zero -> Vector4 {

    Vector4.new(0, 0, 0, 0)
}

//creates a new 3d vector and initialises it with the given
//x, y, z, and w values
method setCoords(x : Number, y : Number, z : Number, w : Number) ->Vector4 {

    Vector4.new(x, y, z, w)
}

//creates a new 4d vector and initialises it the x and y values of the given
//2d vector's x and y values and sets the z and w values to zero
method setVector2(v : Vector2) -> Vector4 {

    Vector4.new(v.x, v.y, 0, 0)
}

//creates a new 4d vector and initialises it the x, y, and z values of the given
//3d vector's x, y, and z values and sets the w value to zero
method setVector3(v : Vector3) -> Vector4 {

    Vector4.new(v.x, v.y, v.z, 0)
}

//creates a new 4d vector and initialises it with the given 4d vector's values
method setVector4(v : Vector4) -> Vector4 {

    Vector4.new(v.x, v.y, v.z, v.w)
}

//VECTOR4 CLASS
//constructs a new 4d vector with the given x', y', z', and w' values
class Vector4.new(x' : Number, y' : Number, z' : Number, w' : Number) {
    
    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'
    var w : Number is public := w'

    //PUBLIC METHODS
    method asString -> String is public {

        "[" ++ x ++ ", " ++ y ++ ", " ++ z ++ ", " ++ w ++ "]"
    }
}
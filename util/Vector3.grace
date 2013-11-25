//CONSTRUCTOR METHODS
//creates a new zero 3d vector
method zero -> Vector3 {

    Vector3.new(0, 0, 0)
}

//creates a new 3d vector and initialises it with the given x, y and z values
method setCoords(x : Number, y : Number, z : Number) -> Vector3 {

    Vector3.new(x, y, z)
}

//creates a new 3d vector and initialises it the x and y values of the given
//2d vector's x and y values and sets the z value to zero
method setVector2(v : Vector2) -> Vector3 {

    Vector3.new(v.x, v.y, 0)
}

//creates a new 3d vector and initialises it with the values of the given
//3d vector
method setVector3(v : Vector3) -> Vector3 {

    Vector3.new(v.x, v.y, v.z)
}

//creates a new 3d vector and initialises it with the given 4d vector's
//x, y, and z values and truncates the w value
method setVector4(v : Vector4) -> Vector3 {

    Vector3.new(v.x, v.y, v.z)
}

//creates a new 3d vector and initialises the x and y values with the given
//2d vector's x and y values, and initialises the z value with the given z value
method setVector2(v : Vector2)Coord(z : Number) -> Vector3 {

    Vector3.new(v.x, v.y, z)
}

//creates a new 3d vector and initialises the x value with the given x value
//and initialises the y and z values with the given 2d vectors x and y values
method setCoord(x : Number)Vector2(v : Vector2) -> Vector3 {

    Vector3.new(x, v.x, v.y)
}

//creates a new 3d vector initialised with x: 1, y: 0, z: 0
method xAxis -> Vector3 {

    Vector3.new(1, 0, 0)
}

//creates a new 3d vector initialised with x: 0, y: 1, z: 0
method yAxis -> Vector3 {

    Vector3.new(0, 1, 0)
}

//creates a new 3d vector initialised with x: 0, y: 0, z: 1
method zAxis -> Vector3 {

    Vector3.new(0, 0, 1)
}

//wow
method doge -> Vector3 {

    Vector3.new(119, 111, 119)
}

//VECTOR3 CLASS
//constructs a new 3d vector with the given x', y', and z' values
class Vector3.new(x' : Number, y' : Number, z' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'

    //PUBLIC METHODS
    method asString -> String is public {

        "[" ++ x ++ ", " ++ y ++ ", " ++ z ++ "]"
    }
}
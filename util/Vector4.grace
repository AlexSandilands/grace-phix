import "PhixMath" as pmath

//CONSTRUCTOR METHODS
//creates a new zero 3d vector
method zero -> Vector4 {

    return Vector4.new(0, 0, 0, 0)
}

//creates a new 3d vector and initialises it with the given
//x, y, z, and w values
method setCoord(x : Number, y : Number, z : Number, w : Number) ->Vector4 {

    return Vector4.new(x, y, z, w)
}

//creates a new 4d vector and initialises it the x and y values of the given
//2d vector's x and y values and sets the z and w values to zero
method setVector2(v : Vector2) -> Vector4 {

    return Vector4.new(v.x, v.y, 0, 0)
}

//creates a new 4d vector and initialises it the x, y, and z values of the given
//3d vector's x, y, and z values and sets the w value to zero
method setVector3(v : Vector3) -> Vector4 {

    Vector4.new(v.x, v.y, v.z, 0)
}

//creates a new 4d vector and initialises it with the given 4d vector's values
method setVector4(v : Vector4) -> Vector4 {

    return Vector4.new(v.x, v.y, v.z, v.w)
}

//creates a new 4d vector and initialises the x and y values to the given
//2d vector's x and y values and initialises the z and w values to the given
//z and w values
method setVector2(v: Vector2) Coord(z : Number, w : Number) -> Vector4 {

    return Vector4.new(v.x, v.y, z, w)
}

//creates a new 4d vector and initialises the x and w values with the given
//x and w values and initialises the y and z values with the given 2d
//vector's x and y values
method setCoord(x : Number) Vector2(v : Vector2) Coord(w : Number) -> Vector4 {

    return Vector4.new(x, v.x, v.y, w)
}

//creates a new 4d vector and initialises the x and y values with the given
//x and y values and initialises the z and w values with the given 2d
//vector's x and y values
method setCoord(x : Number, y : Number) Vector2(v : Vector2) -> Vector4 {

    return Vector4.new(x, y, v.x, v.y)
}

//creates a new 4d vector and initialises the x and y values using the given
//2d vector v x and y values and initialises the z and w values using the
//given 2d vector v' x and y values
method setVector2(v : Vector2) Vector2(v' : Vector2) -> Vector4 {

    return Vector4.new(v.x, v.y, v'.x, v'.y)
}

//creates a new 4d vector and initialises the x, y, and z values using the
//given 3d vector's x, y, and z values and initialises the w value with the
//given w value
method setVector3(v : Vector3) Coord(w : Number) -> Vector4 {

    return Vector4.new(v.x, v.y, v.z, w)
}

//creates a new 4d vector and initialises the x value with the given x value
//and initialises the y, z, and w values with the given 3d vector's x, y, and z
//values
method setCoord(x : Number) Vector3(v : Vector3) -> Vector4 {

    return Vector4.new(x, v.x, v.y, v.z)
}

//creates a new 4d vector initialised with x: 1, y: 0, z: 0 w: 0
method xAxis -> Vector4 {

    return Vector4.new(1, 0, 0, 0)
}

//creates a new 4d vector initialised with x: 0, y: 1, z: 0 w: 0
method yAxis -> Vector4 {

    return Vector4.new(0, 1, 0, 0)
}

//creates a new 4d vector initialised with x: 0, y: 0, z: 1 w: 0
method zAxis -> Vector4 {

    return Vector4.new(0, 0, 1, 0)
}

//creates a new 4d vector initialised with x: 0, y: 0, z: 0 w: 1
method wAxis -> Vector4 {

    return Vector4.new(0, 0, 0, 1)
}

//VECTOR4 CLASS
//constructs a new 4d vector with the given x', y', z', and w' values
class Vector4.new(x' : Number, y' : Number, z' : Number, w' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'
    var w : Number is public := w'

    //OPERATORS
    //returns true if this vector has the same values as the given vector
    method ==(v : Vector4) -> Boolean is public {

        return (x == v.x) && ((y == v.y) && ((z == v.z) && (w == v.w)))
    }

    //returns true if this vector has different values from the given vector
    method !=(v : Vector4) -> Boolean is public {

        return !((x == v.x) && ((y == v.y) && ((z == v.z) && (w == v.w))))
    }

    //returns if the magnitude of this vector is less than the
    //magnitude of the given vector
    method <(v : Vector4) -> Boolean is public {

        return self.magnitude < v.magnitude
    }

    //returns if the magnitude of this vector is greater than the
    //magnitude of the given vector
    method >(v : Vector4) -> Boolean is public {

        return self.magnitude < v.magnitude
    }

    //returns the inversion of this vector
    method prefix- -> Vector4 is public {

        return Vector4.new(-x, -y, -z, -w)
    }

    //creates a new 4d vector as the result of adding this vector with
    //the given vector
    method +(v : Vector4) -> Vector4 is public {

        return Vector4.new(x + v.x, y + v.y, z + v.z, w + v.w)
    }

    //creates a new 4d vector as the result of subtracting this vector
    //from the the given vector
    method -(v : Vector4) -> Vector4 is public {

        return Vector4.new(x - v.x, y - v.y, z - v.z, w - v.w)
    }

    //creates a new 4d vector as the result of multiplying the components
    //of this vector by the given scalar
    method *(s : Number) -> Vector4 is public {

        return Vector4.new(x * s, y * s, z * s, w * s)
    }

    //creates a new 4d vector as the result of dividing the components
    //of this vector by the given scalar
    method /(s : Number) -> Vector4 is public {

        return Vector4.new(x / s, y / s, z / s, w / s)
    }

    //PUBLIC METHODS
    //returns the magnitude of this vector
    method magnitude -> Number is public {

        return pmath.sqrt((x * x) + (y * y) + (z * z) + (w * w))
    }

    //returns a normalised version of this vector
    method normalize -> Vector4 is public {

        def mag = self.magnitude

        return Vector4.new(x / mag, y / mag, z / mag, w / mag)
    }

    //creates a new 4d vector as the result of adding the given scalar
    //to this vector
    method addScalar(s : Number) -> Vector4 is public {

        return Vector4.new(x + s, y + s, z + s, w + s)
    }

    //creates a new 4d vector as the result of subtracting the given scalar
    //from this vector
    method subScalar(s : Number) -> Vector4 is public {

        return Vector4.new(x - s, y - s, z - s, w - s)
    }

    //returns the dot product of this vector with the other given vector
    method dot(v : Vector4) -> Number is public {

        return (x * v.x) + (y * v.y) + (z * v.z) + (w * v.w)
    }

    //returns the distance from this vector to the other vector
    method distanceTo(v : Vector4) -> Number is public {

        return pmath.sqrt(((x - v.x) ^ 2) + ((y - v.y) ^ 2) +
            ((z - v.z) ^ 2) + ((w - v.w) ^ 2))
    }

    //returns the angle between this vector and the other vector
    method angleBetween(v : Vector4) -> Number is public {

        //TODO
    }

    //Check out glm vector functions

    //returns the vector as a list
    method toList -> List is public {

        return [x, y, z, w]
    }

    //returns the vector as a string
    method asString -> String is public {

        return "[" ++ x ++ ", " ++ y ++ ", " ++ z ++ ", " ++ w ++ "]"
    }
}
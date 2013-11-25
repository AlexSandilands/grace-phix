import "PhixMath" as pmath

//CONSTRUCTOR METHODS
//creates a new zero 3d vector
method zero -> Vector3 {

    return Vector3.new(0, 0, 0)
}

//creates a new 3d vector and initialises it with the given x, y and z values
method setCoord(x : Number, y : Number, z : Number) -> Vector3 {

    return Vector3.new(x, y, z)
}

//creates a new 3d vector and initialises it the x and y values of the given
//2d vector's x and y values and sets the z value to zero
method setVector2(v : Vector2) -> Vector3 {

    return Vector3.new(v.x, v.y, 0)
}

//creates a new 3d vector and initialises it with the values of the given
//3d vector
method setVector3(v : Vector3) -> Vector3 {

    return Vector3.new(v.x, v.y, v.z)
}

//creates a new 3d vector and initialises it with the given 4d vector's
//x, y, and z values and truncates the w value
method setVector4(v : Vector4) -> Vector3 {

    return Vector3.new(v.x, v.y, v.z)
}

//creates a new 3d vector and initialises the x and y values with the given
//2d vector's x and y values, and initialises the z value with the given z value
method setVector2(v : Vector2) Coord(z : Number) -> Vector3 {

    return Vector3.new(v.x, v.y, z)
}

//creates a new 3d vector and initialises the x value with the given x value
//and initialises the y and z values with the given 2d vectors x and y values
method setCoord(x : Number) Vector2(v : Vector2) -> Vector3 {

    return Vector3.new(x, v.x, v.y)
}

//creates a new 3d vector initialised with x: 1, y: 0, z: 0
method xAxis -> Vector3 {

    return Vector3.new(1, 0, 0)
}

//creates a new 3d vector initialised with x: 0, y: 1, z: 0
method yAxis -> Vector3 {

    return Vector3.new(0, 1, 0)
}

//creates a new 3d vector initialised with x: 0, y: 0, z: 1
method zAxis -> Vector3 {

    return Vector3.new(0, 0, 1)
}

//wow
method doge -> Vector3 {

    return Vector3.new(119, 111, 119)
}

//VECTOR3 CLASS
//constructs a new 3d vector with the given x', y', and z' values
class Vector3.new(x' : Number, y' : Number, z' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'

    //OPERATORS
    //returns true if this vector has the same values as the given vector
    method ==(v : Vector3) -> Boolean is public {

        return (x == v.x) && ((y == v.y) && (z == v.z))
    }

    //returns true if this vector has different values from the given vector
    method !=(v : Vector3) -> Boolean is public {

        return !((x == v.x) && ((y == v.y) && (y == v.y)))
    }

    //returns if the magnitude of this vector is less than the
    //magnitude of the given vector
    method <(v : Vector3) -> Boolean is public {

        return self.magnitude < v.magnitude
    }

    //returns if the magnitude of this vector is greater than the
    //magnitude of the given vector
    method >(v : Vector3) -> Boolean is public {

        return self.magnitude > v.magnitude
    }

    //returns the inversion of this vector
    method prefix- -> Vector3 is public {

        return Vector3.new(-x, -y, -z)
    }

    //creates a new 3d vector as the result of adding this vector with
    //the given vector
    method +(v : Vector3) -> Vector3 is public {

        return Vector3.new(x + v.x, y + v.y, z + v.z)
    }

    //creates a new 3d vector as the result of subtracting this vector
    //from the the given vector
    method -(v : Vector3) -> Vector3 is public {

        return Vector3.new(x - v.x, y - v.y, z - v.z)
    }

    //creates a new 3d vector as the result of multiplying the components
    //of this vector by the given scalar
    method *(s : Number) -> Vector3 is public {

        return Vector3.new(x * s, y * s, z * s)
    }

    //creates a new 3d vector as the result of dividing the components
    //of this vector by the given scalar
    method /(s : Number) -> Vector3 is public {

        return Vector3.new(x / s, y / s, z / s)
    }

    //PUBLIC METHODS
    //returns the magnitude of this vector
    method magnitude -> Number is public {

        return pmath.sqrt((x * x) + (y * y) + (z * z))
    }

    //returns a normalised version of this vector
    method normalize -> Vector3 is public {

        def mag = self.magnitude

        return Vector3.new(x / mag, y / mag, z / mag)
    }

    //creates a new 3d vector as the result of adding the given scalar
    //to this vector
    method addScalar(s : Number) -> Vector3 is public {

        return Vector3.new(x + s, y + s, z + s)
    }

    //creates a new 3d vector as the result of subtracting the given scalar
    //from this vector
    method subScalar(s : Number) -> Vector3 is public {

        return Vector3.new(x - s, y - s, z - s)
    }

    //returns the dot product of this vector with the other given vector
    method dot(v : Vector3) -> Number is public {

        return (x * v.x) + (y * v.y) + (z * v.z)
    }

    //returns the cross product of this vector and the other given vector
    method cross(v : Vector3) -> Vector3 is public {

        def cx = (y * v.z) - (z * v.y)
        def cy = (x * v.z) - (z * v.x)
        def cz = (x * v.y) - (y * v.x)

        return Vector3.new(cx, cy, cz)
    }

    //returns the distance from this vector to the other vector
    method distanceTo(v : Vector3) -> Number is public {

        return pmath.sqrt(((x - v.x) ^ 2) + ((y - v.y) ^ 2) + ((z - v.z) ^ 2))
    }

    //returns the angle between this vector and the other vector
    method angleBetween(v : Vector3) -> Number is public {

        //TODO
    }

    //Check out glm vector functions

    //returns the vector as a list
    method toList -> List is public {

        return [x, y, z]
    }

    //returns the vector as a string
    method asString -> String is public {

        return "[" ++ x ++ ", " ++ y ++ ", " ++ z ++ "]"
    }
}
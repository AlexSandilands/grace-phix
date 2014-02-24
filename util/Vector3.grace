import "GMath" as math

// Vector type which is three dimensional
// Ie it has x, y and z coordinates
type Vector3 = {

    x -> Number
    y -> Number

    ==(v : Vector3) -> Boolean
    !=(v : Vector3) -> Boolean
    + (v : Vector3) -> Vector3
    - (v : Vector3) -> Vector3
    * (s : Number)  -> Vector3
    / (s : Number)  -> Vector3
    < (v : Vector3) -> Boolean
    > (v : Vector3) -> Boolean

    prefix- -> Vector3
    magnitude -> Number
    normalize -> Vector3

    addScalar(s : Number) -> Vector3
    subScalar(s : Number) -> Vector3

    toList -> List

    asString -> String
}

// CONSTRUCTOR METHODS
// Creates a new zero 3d vector
method zero -> Vector3 {

    aVector3.new(0, 0, 0)
}

// Creates a new 3d vector and initialises it with the given x, y and z values
method x(x' : Number) y(y' : Number) z(z' : Number) -> Vector3 {

    aVector3.new(x', y', z')
}

// Creates a new 3d vector and initialises the x and y values with the given
// 2d vector's x and y values, and initialises the z value with the given z value
method xy(v : Vector2) z(z : Number) -> Vector3 {

    aVector3.new(v.x, v.y, z)
}

// Creates a new 3d vector and initialises the x value with the given x value
// and initialises the y and z values with the given 2d vectors x and y values
method x(x : Number) yz(v : Vector2) -> Vector3 {

    aVector3.new(x, v.x, v.y)
}

// Creates a new 3d vector and initialises it with the values of the given
// 3d vector
method xyz(v : Vector3) -> Vector3 {

    aVector3.new(v.x, v.y, v.z)
}

// Creates a new 3d vector and initialises it the x and y values of the given
// 2d vector's x and y values and sets the z value to zero
method fromVector2(v : Vector2) -> Vector3 {

    aVector3.new(v.x, v.y, 0)
}

// Creates a new 3d vector and initialises it with the given 4d vector's
// x, y, and z values and truncates the w value
method fromVector4(v : Vector4) -> Vector3 {

    aVector3.new(v.x, v.y, v.z)
}

// Creates a new 3d vector initialised with x: 1, y: 0, z: 0
method xAxis -> Vector3 {

    aVector3.new(1, 0, 0)
}

// Creates a new 3d vector initialised with x: 0, y: 1, z: 0
method yAxis -> Vector3 {

    aVector3.new(0, 1, 0)
}

// Creates a new 3d vector initialised with x: 0, y: 0, z: 1
method zAxis -> Vector3 {

    aVector3.new(0, 0, 1)
}

// Wow
method doge -> Vector3 {

    aVector3.new(119, 111, 119)
}

// Returns the dot product of this vector with the other given vector
method dot(v1 : Vector3, v2 : Vector3) -> Number is public {

    (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z)
}

// Returns the cross product of this vector and the other given vector
method cross(v1 : Vector3, v2 : Vector3) -> Vector3 is public {

    def cx = (v1.y * v2.z) - (v1.z * v2.y)
    def cy = (v1.x * v2.z) - (v1.z * v2.x)
    def cz = (v1.x * v2.y) - (v1.y * v2.x)

    return aVector3.new(cx, cy, cz)
}

// Returns the distance from this vector to the other vector
method distanceTo(v1 : Vector3, v2 : Vector3) -> Number is public {

    math.sqrt(((v1.x - v2.x) ^ 2) + ((v1.y - v2.y) ^ 2) + ((v1.z - v2.z) ^ 2))
}

// Returns the angle between this vector and the other vector
method angleBetween(v1 : Vector3, v2 : Vector3) -> Number is public {

    math.acos(dot(v1, v2)/(v1.magnitude*v2.magnitude))
}

// Clamps the values of the vector between the given thresholds
method clamp (v : Vector2) Between (lower : Number, upper : Number) -> Vector3 {

    return aVector3.new(
        math.clamp(v.x) between(lower, upper),
        math.clamp(v.y) between(lower, upper),
        math.clamp(v.z) between(lower, upper))
}

// Clamps the values of the vector above the given threshold
method clamp (v : Vector2) Above (threshold : Number) -> Vector3 {

    return aVector3.new(
        math.clamp(v.x) above(threshold),
        math.clamp(v.y) above(threshold),
        math.clamp(v.z) above(threshold))
}

// Clamps the values of the vector below the given threshold
method clamp (v : Vector2) Below (threshold : Number) -> Vector3 {

    return aVector3.new(
        math.clamp(v.x) below(threshold),
        math.clamp(v.y) below(threshold),
        math.clamp(v.z) below(threshold))
}



// VECTOR3 CLASS
// Constructs a new 3d vector with the given x', y', and z' values
class aVector3.new(x' : Number, y' : Number, z' : Number) -> Vector3 {

    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'


    // Returns true if this vector has the same values as the given vector
    method ==(v : Vector3) -> Boolean is public {

        (x == v.x) && ((y == v.y) && (z == v.z))
    }

    // Returns true if this vector has different values from the given vector
    method !=(v : Vector3) -> Boolean is public {

        !((x == v.x) && ((y == v.y) && (y == v.y)))
    }

    // Creates a new 3d vector as the result of adding this vector with
    // the given vector
    method +(v : Vector3) -> Vector3 is public {

        aVector3.new(x + v.x, y + v.y, z + v.z)
    }

    // Creates a new 3d vector as the result of subtracting this vector
    // from the the given vector
    method -(v : Vector3) -> Vector3 is public {

        aVector3.new(x - v.x, y - v.y, z - v.z)
    }

    // Creates a new 3d vector as the result of multiplying the components
    // of this vector by the given scalar
    method *(s : Number) -> Vector3 is public {

        aVector3.new(x * s, y * s, z * s)
    }

    // Creates a new 3d vector as the result of dividing the components
    // of this vector by the given scalar
    method /(s : Number) -> Vector3 is public {

        aVector3.new(x / s, y / s, z / s)
    }

    // Returns if the magnitude of this vector is less than the
    // magnitude of the given vector
    method <(v : Vector3) -> Boolean is public {

        self.magnitude < v.magnitude
    }

    // Returns if the magnitude of this vector is greater than the
    // magnitude of the given vector
    method >(v : Vector3) -> Boolean is public {

        self.magnitude > v.magnitude
    }

    // Returns the inversion of this vector
    method prefix- -> Vector3 is public {

        aVector3.new(-x, -y, -z)
    }

    // Returns the magnitude of this vector
    method magnitude -> Number is public {

        math.sqrt((x * x) + (y * y) + (z * z))
    }

    // Returns a normalised version of this vector
    method normalize -> Vector3 is public {

        def mag = self.magnitude

        return aVector3.new(x / mag, y / mag, z / mag)
    }

    // Returns a new vector that is this vector clamped between the two values
    method clampBetween(lower : Number, upper : Number) -> Vector3 {

        return aVector3.new(math.clamp(x) between(lower, upper),
            math.clamp(y) between(lower, upper),
            math.clamp(z) between(lower, upper))
    }

    // Returns a new vector that is this vector clamped above the given value
    method clampAbove(threshold : Number) -> Vector3 {

        return aVector3.new(math.clamp(x) above(threshold),
            math.clamp(y) above(threshold),
            math.clamp(z) above(threshold))
    }

    // Returns a new vector that is this vector clamped below the given value
    method clampBelow(threshold : Number) -> Vector3 {

        return aVector3.new(math.clamp(x) below(threshold),
            math.clamp(y) below(threshold),
            math.clamp(z) below(threshold))
    }

    // Creates a new 3d vector as the result of adding the given scalar
    // to this vector
    method addScalar(s : Number) -> Vector3 is public {

        aVector3.new(x + s, y + s, z + s)
    }

    // Creates a new 3d vector as the result of subtracting the given scalar
    // from this vector
    method subScalar(s : Number) -> Vector3 is public {

        aVector3.new(x - s, y - s, z - s)
    }

    // Check out glm vector functions

    // Returns the vector as a list
    method toList -> List is public {

        [x, y, z]
    }

    // Returns the vector as a string
    method asString -> String is public {

        "[{x}, {y}, {z}]"
    }
}
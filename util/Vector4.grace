import "GMath" as math

// Vector type which is four dimensional
// Ie it has x, y, z and w coordinates.
type Vector4 = {

    x -> Number
    y -> Number

    ==(v : Vector4) -> Boolean
    !=(v : Vector4) -> Boolean
    + (v : Vector4) -> Vector4
    - (v : Vector4) -> Vector4
    * (s : Number)  -> Vector4
    / (s : Number)  -> Vector4
    < (v : Vector4) -> Boolean
    > (v : Vector4) -> Boolean

    prefix- -> Vector4
    magnitude -> Number
    normalize -> Vector4

    clampBetween(lower : Number, upper : Number) -> Vector4
    clampAbove(threshold : Number) -> Vector4
    clampBelow(threshold : Number) -> Vector4

    addScalar(s : Number) -> Vector4
    subScalar(s : Number) -> Vector4

    toList -> List

    asString -> String
}

// CONSTRUCTOR METHODS
// Creates a new zero 3d vector
method zero -> Vector4 {

    aVector4.new(0, 0, 0, 0)
}

// Creates a new 3d vector and initialises it with the given
// x, y, z, and w values
method setCoord(x : Number, y : Number, z : Number, w : Number) ->Vector4 {

    aVector4.new(x, y, z, w)
}

// Creates a new 4d vector and initialises it the x and y values of the given
// 2d vector's x and y values and sets the z and w values to zero
method setVector2(v : Vector2) -> Vector4 {

    aVector4.new(v.x, v.y, 0, 0)
}

// Creates a new 4d vector and initialises it the x, y, and z values of the given
// 3d vector's x, y, and z values and sets the w value to zero
method setVector3(v : Vector3) -> Vector4 {

    aVector4.new(v.x, v.y, v.z, 0)
}

// Creates a new 4d vector and initialises it with the given 4d vector's values
method setVector4(v : Vector4) -> Vector4 {

    aVector4.new(v.x, v.y, v.z, v.w)
}

// Creates a new 4d vector and initialises the x and y values to the given
// 2d vector's x and y values and initialises the z and w values to the given
// z and w values
method setVector2(v: Vector2) coord(z : Number, w : Number) -> Vector4 {

    aVector4.new(v.x, v.y, z, w)
}

// Creates a new 4d vector and initialises the x and w values with the given
// x and w values and initialises the y and z values with the given 2d
// vector's x and y values
method setCoord(x : Number) vector2(v : Vector2) Coord(w : Number) -> Vector4 {

    aVector4.new(x, v.x, v.y, w)
}

// Creates a new 4d vector and initialises the x and y values with the given
// x and y values and initialises the z and w values with the given 2d
// vector's x and y values
method setCoord(x : Number, y : Number) vector2(v : Vector2) -> Vector4 {

    aVector4.new(x, y, v.x, v.y)
}

// Creates a new 4d vector and initialises the x and y values using the given
// 2d vector v x and y values and initialises the z and w values using the
// given 2d vector v' x and y values
method setVector2(v : Vector2) vector2(v' : Vector2) -> Vector4 {

    aVector4.new(v.x, v.y, v'.x, v'.y)
}

// Creates a new 4d vector and initialises the x, y, and z values using the
// given 3d vector's x, y, and z values and initialises the w value with the
// given w value
method setVector3(v : Vector3) coord(w : Number) -> Vector4 {

    aVector4.new(v.x, v.y, v.z, w)
}

// Creates a new 4d vector and initialises the x value with the given x value
// and initialises the y, z, and w values with the given 3d vector's x, y, and z
// values
method setCoord(x : Number) vector3(v : Vector3) -> Vector4 {

    aVector4.new(x, v.x, v.y, v.z)
}

// Creates a new 4d vector initialised with x: 1, y: 0, z: 0 w: 0
method xAxis -> Vector4 {

    aVector4.new(1, 0, 0, 0)
}

// Creates a new 4d vector initialised with x: 0, y: 1, z: 0 w: 0
method yAxis -> Vector4 {

    aVector4.new(0, 1, 0, 0)
}

// Creates a new 4d vector initialised with x: 0, y: 0, z: 1 w: 0
method zAxis -> Vector4 {

    aVector4.new(0, 0, 1, 0)
}

// Creates a new 4d vector initialised with x: 0, y: 0, z: 0 w: 1
method wAxis -> Vector4 {

    aVector4.new(0, 0, 0, 1)
}

// Returns the dot product of this vector with the other given vector
method dot(v1 : Vector4, v2 : Vector4) -> Number is public {

    (v1.x * v2.x) + (v1.y * v2.y) + (v1.z * v2.z) + (v1.w * v2.w)
}

// Returns the distance from this vector to the other vector
method distanceTo(v1 : Vector4, v2 : Vector4) -> Number is public {

    return math.sqrt(((v1.x - v2.x) ^ 2) + ((v1.y - v2.y) ^ 2) +
        ((v1.z - v2.z) ^ 2) + ((v1.w - v2.w) ^ 2))
}

// Returns the angle between this vector and the other vector
method angleBetween(v1 : Vector4, v2 : Vector4) -> Number is public {

    math.acos(dot(v1, v2)/(v1.magnitude*v2.magnitude))
}



// VECTOR4 CLASS
// Constructs a new 4d vector with the given x', y', z', and w' values
class aVector4.new(x' : Number, y' : Number, z' : Number, w' : Number)
    -> Vector4 {

    var x : Number is public := x'
    var y : Number is public := y'
    var z : Number is public := z'
    var w : Number is public := w'

    // Returns true if this vector has the same values as the given vector
    method ==(v : Vector4) -> Boolean is public {

        (x == v.x) && ((y == v.y) && ((z == v.z) && (w == v.w)))
    }

    // Returns true if this vector has different values from the given vector
    method !=(v : Vector4) -> Boolean is public {

        !((x == v.x) && ((y == v.y) && ((z == v.z) && (w == v.w))))
    }

    // Creates a new 4d vector as the result of adding this vector with
    // the given vector
    method +(v : Vector4) -> Vector4 is public {

        aVector4.new(x + v.x, y + v.y, z + v.z, w + v.w)
    }

    // Creates a new 4d vector as the result of subtracting this vector
    // from the the given vector
    method -(v : Vector4) -> Vector4 is public {

        aVector4.new(x - v.x, y - v.y, z - v.z, w - v.w)
    }

    // Creates a new 4d vector as the result of multiplying the components
    // of this vector by the given scalar
    method *(s : Number) -> Vector4 is public {

        aVector4.new(x * s, y * s, z * s, w * s)
    }

    // Creates a new 4d vector as the result of dividing the components
    // of this vector by the given scalar
    method /(s : Number) -> Vector4 is public {

        aVector4.new(x / s, y / s, z / s, w / s)
    }

    // Returns if the magnitude of this vector is less than the
    // magnitude of the given vector
    method <(v : Vector4) -> Boolean is public {

        self.magnitude < v.magnitude
    }

    // Returns if the magnitude of this vector is greater than the
    // magnitude of the given vector
    method >(v : Vector4) -> Boolean is public {

        self.magnitude < v.magnitude
    }

    // Returns the inversion of this vector
    method prefix- -> Vector4 is public {

        aVector4.new(-x, -y, -z, -w)
    }

    // Returns the magnitude of this vector
    method magnitude -> Number is public {

        math.sqrt((x * x) + (y * y) + (z * z) + (w * w))
    }

    // Returns a normalised version of this vector
    method normalize -> Vector4 is public {

        def mag = self.magnitude

        aVector4.new(x / mag, y / mag, z / mag, w / mag)
    }

    // Returns a new vector that is this vector clamped between the two values
    method clampBetween(lower : Number, upper : Number) -> Vector4 {

        return aVector4.new(math.clamp(x) between(lower, upper),
            math.clamp(y) between(lower, upper),
            math.clamp(z) between(lower, upper),
            math.clamp(w) between(lower, upper))
    }

    // Returns a new vector that is this vector clamped above the given value
    method clampAbove(threshold : Number) -> Vector4 {

        return aVector4.new(math.clamp(x) above(threshold),
            math.clamp(y) above(threshold),
            math.clamp(z) above(threshold),
            math.clamp(w) above(threshold))
    }

    // Returns a new vector that is this vector clamped below the given value
    method clampBelow(threshold : Number) -> Vector4 {

        return aVector4.new(math.clamp(x) below(threshold),
            math.clamp(y) below(threshold),
            math.clamp(z) below(threshold),
            math.clamp(w) below(threshold))
    }

    // Creates a new 4d vector as the result of adding the given scalar
    // to this vector
    method addScalar(s : Number) -> Vector4 is public {

        aVector4.new(x + s, y + s, z + s, w + s)
    }

    // Creates a new 4d vector as the result of subtracting the given scalar
    // from this vector
    method subScalar(s : Number) -> Vector4 is public {

        aVector4.new(x - s, y - s, z - s, w - s)
    }

    // Check out glm vector functions

    // Returns the vector as a list
    method toList -> List is public {

        [x, y, z, w]
    }

    // Returns the vector as a string
    method asString -> String is public {

        "[{x}, {y}, {z}, {w}]"
    }
}
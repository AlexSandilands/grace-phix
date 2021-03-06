import "GMath" as math

// Two dimensional Vector type.
// Ie is has an x and y coordinate.
type Vector2 = {
    x -> Number
    y -> Number

    ==(v : Vector2) -> Boolean
    !=(v : Vector2) -> Boolean
    + (v : Vector2) -> Vector2
    - (v : Vector2) -> Vector2
    * (s : Number)  -> Vector2
    / (s : Number)  -> Vector2
    < (v : Vector2) -> Boolean
    > (v : Vector2) -> Boolean

    prefix- -> Vector2
    magnitude -> Number
    normalize -> Vector2

    addScalar(s : Number) -> Vector2
    subScalar(s : Number) -> Vector2

    toList -> List

    asString -> String
}


// CONSTRUCTOR METHODS

// Creates a new zero 2d vector
method zero -> Vector2 {

    aVector2.new(0, 0)
}

// Creates a new 2d vector and initialises it with the given x and y values
method x(x' : Number) y(y' : Number) -> Vector2 {

    aVector2.new(x', y')
}

// Creates a new 2d vector and initialises it with the values of the given
// 2d vector
method xy(v : Vector2) -> Vector2 {

    aVector2.new(v.x, v.y)
}

// Creates a new 2d vector and initialises it with the x and y values of the
// given 3d vector and truncates the z value
method fromVector3(v : Vector3) -> Vector2 {

    aVector2.new(v.x, v.y)
}

// Creates a new 2d vector and initialises it with the x and y values of the
// given 4d vector and truncates the z and w values
method fromVector4(v : Vector4) -> Vector2 {

    aVector2.new(v.x, v.y)
}

// Creates a new 2d vector initialised with x: 1, y: 0
method xAxis -> Vector2 {

    aVector2.new(1, 0);
}

// Creates a new 2d vector initialised with x: 0, y: 1
method yAxis -> Vector2 {

    aVector2.new(0, 1);
}


// Returns the dot product of this vector with the other given vector
method dot(v1 : Vector2, v2 : Vector2) -> Number is public {

    (v1.x * v2.x) + (v1.y * v2.y)
}

// Returns the distance from this vector to the other vector
method distanceBetween(v1 : Vector2, v2 : Vector2) -> Number is public {

    math.sqrt(((v1.x - v2.x) ^ 2) + ((v1.y - v2.y) ^ 2))
}

// Returns the angle between this vector and the other vector, in radians
method angleBetween(v1 : Vector2, v2 : Vector2) -> Number is public {

    math.acos(dot(v1, v2)/(v1.magnitude*v2.magnitude))
}

// Clamps the values of the vector between the given thresholds
method clamp (v : Vector2) Between (lower : Number, upper : Number) -> Vector2 {

    return aVector2.new(math.clamp(v.x) between(lower, upper),
       math.clamp(v.y) between(lower, upper))
}

// Clamps the values of the vector above the given threshold
method clamp (v : Vector2) Above (threshold : Number) -> Vector2 {

    return aVector2.new(math.clamp(v.x) above(threshold),
       math.clamp(v.y) above(threshold))
}

// Clamps the values of the vector below the given threshold
method clamp (v : Vector2) Below (threshold : Number) -> Vector2 {

    return aVector2.new(math.clamp(v.x) below(threshold),
        math.clamp(v.y) below(threshold))
}



// VECTOR2 CLASS
// Constructs a new 2d vector with the given x' and y' values
class aVector2.new(x' : Number, y' : Number) -> Vector2 {

    var x : Number is public := x'
    var y : Number is public := y'

    // OPERATORS
    // Returns true if this vector has the same values as the given vector
    method ==(v : Vector2) -> Boolean is public {

        (x == v.x) && (y == v.y)
    }

    // Returns true if this vector has different values from the given vector
    method !=(v : Vector2) -> Boolean is public {

        !((x == v.x) && (y == v.y))
    }

    // Creates a new 2d vector as the result of adding this vector with
    // the given vector
    method +(v : Vector2) -> Vector2 is public {

        aVector2.new(x + v.x, y + v.y)
    }

    // Creates a new 2d vector as the result of subtracting this vector
    // from the the given vector
    method -(v : Vector2) -> Vector2 is public {

        aVector2.new(x - v.x, y - v.y)
    }

    // Creates a new 2d vector as the result of multiplying the components
    // of this vector by the given scalar
    method *(s : Number) -> Vector2 is public {

        aVector2.new(x * s, y * s)
    }

    // Creates a new 2d vector as the result of dividing the components
    // of this vector by the given scalar
    method /(s : Number) -> Vector2 is public {

        aVector2.new(x / s, y / s)
    }

    // Returns if the magnitude of this vector is less than the
    // magnitude of the given vector
    method <(v : Vector2) -> Boolean is public {

        self.magnitude < v.magnitude
    }

    // Returns if the magnitude of this vector is greater than the
    // magnitude of the given vector
    method >(v : Vector2) -> Boolean is public {

        self.magnitude > v.magnitude
    }

    // Returns the inversion of this vector
    method prefix- -> Vector2 is public {

        aVector2.new(-x, -y)
    }

    // Returns the magnitude of this vector
    method magnitude -> Number is public {

        math.sqrt((x * x) + (y * y))
    }

    // Returns a normalised version of this vector
    method normalize -> Vector2 is public {

        def mag = self.magnitude

        return aVector2.new(x / mag, y / mag)
    }

    // Creates a new 2d vector as the result of adding the given scalar
    // s to this vector
    method addScalar(s : Number) -> Vector2 is public {

        aVector2.new(x + s, y + s)
    }

    // Creates a new 2d vector as the result of subtracting the given scalar
    // s from this vector
    method subScalar(s : Number) -> Vector2 is public {

        aVector2.new(x - s, y - s)
    }


    // Check out glm vector functions

    // Returns the vector as a list
    method toList -> List is public {

        [x, y]
    }

    // Returns the vector as a string
    method asString -> String is public {

        "[{x}, {y}]"
    }
}
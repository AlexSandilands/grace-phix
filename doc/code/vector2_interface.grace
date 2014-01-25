
// Two dimensional Vector type.
// Ie is has an x and y coordinate.
type Vector2 = {

    // The first coordinate of this vector
    x -> Number

    // The second coordinate of this vector
    y -> Number

    // OPERATORS

    // Returns true if this vector has the same values as the given vector v
    ==(v : Vector2) -> Boolean

    // Returns true if this vector has different values from the given vector v
    !=(v : Vector2) -> Boolean

    // Creates a new 2d vector as the result of adding this vector with
    // the given vector v
    +(v : Vector2) -> Vector2

    // Creates a new 2d vector as the result of subtracting this vector
    // from the the given vector v
    -(v : Vector2) -> Vector2

    // Creates a new 2d vector as the result of multiplying the components
    // of this vector by the given scalar s
    *(s : Number) -> Vector2

    // Creates a new 2d vector as the result of dividing the components
    // of this vector by the given scalar s
    /(s : Number) -> Vector2

    // Returns if the magnitude of this vector is less than the
    // magnitude of the given vector
    <(v : Vector2) -> Boolean

    // Returns if the magnitude of this vector is greater than the
    // magnitude of the given vector
    >(v : Vector2) -> Boolean

    // Returns the inversion of this vector
    prefix- -> Vector2

    // METHODS

    // Returns the magnitude of this vector
    magnitude -> Number

    // Returns a normalised version of this vector
    normalize -> Vector2

    // Returns a new vector that is this vector clamped between the two values
    clampBetween(lower : Number, upper : Number) -> Vector2

    // Returns a new vector that is this vector clamped above the given threshold
    clampAbove(threshold : Number) -> Vector2

    // Returns a new vector that is this vector clamped below the given threshold
    clampBelow(threshold : Number) -> Vector2

    // Creates a new 2d vector as the result of adding the given scalar s to this vector
    addScalar(s : Number) -> Vector2

    // Creates a new 2d vector as the result of subtracting the given scalar s from this vector
    subScalar(s : Number) -> Vector2

    // Returns the vector as a list
    toList -> List

    // Returns the vector as a string
    asString -> String
}

// CONSTRUCTOR METHODS

// Creates a new zero 2d vector
method zero -> Vector2

// Creates a new 2d vector and initialises it with the given x and y values
method setCoord(x : Number, y : Number) -> Vector2

// Creates a new 2d vector and initialises it with the values of the given
// 2d vector
method setVector2(v : Vector2) -> Vector2

// Creates a new 2d vector and initialises it with the x and y values of the
// given 3d vector and truncates the z value
method setVector3(v : Vector3) -> Vector2

// Creates a new 2d vector and initialises it with the x and y values of the
// given 4d vector and truncates the z and w values
method setVector4(v : Vector4) -> Vector2

// Creates a new 2d vector initialised with x: 1, y: 0
method xAxis -> Vector2

// Creates a new 2d vector initialised with x: 0, y: 1
method yAxis -> Vector2


// VECTOR MATH

// Returns the dot product of this vector with the other given vector
method dot(v1 : Vector2, v2 : Vector2) -> Number is public

// Returns the distance from this vector to the other vector
method distanceBetween(v1 : Vector2, v2 : Vector2) -> Number is public

// Returns the angle between this vector and the other vector, in radians
method angleBetween(v1 : Vector2, v2 : Vector2) -> Number is public
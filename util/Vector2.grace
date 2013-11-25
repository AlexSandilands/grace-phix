//CONSTRUCTOR METHODS
//creates a new zero 2d vector
method zero -> Vector2 {

    return Vector2.new(0, 0)
}

//creates a new 2d vector and initialises it with the given x and y values
method setCoords(x : Number, y : Number) -> Vector2 {

    return Vector2.new(x, y)
}

//creates a new 2d vector and initialises it with the values of the given
//2d vector
method setVector2(v : Vector2) -> Vector2 {

    return Vector2.new(v.x, v.y)
}

//creates a new 2d vector and initialises it with the x and y values of the
//given 3d vector and truncates the z value
method setVector3(v : Vector3) -> Vector2 {

    return Vector2.new(v.x, v.y)
}

//creates a new 2d vector and initialises it with the x and y values of the
//given 4d vector and truncates the z and w values
method setVector4(v : Vector4) -> Vector2 {

    return Vector2.new(v.x, v.y)
}

//creates a new 2d vector initialised with x: 1, y: 0
method xAxis -> Vector2 {

    return Vector2.new(1, 0);
}

//creates a new 2d vector initialised with x: 0, y: 1
method yAxis -> Vector2 {

    return Vector2.new(0, 1);
}

//VECTOR2 CLASS
//constructs a new 2d vector with the given x' and y' values
class Vector2.new(x' : Number, y' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'

    //OPERATORS
    //returns true if this vector has the same values as the given vector
    method ==(v : Vector2) -> Vector2 is public {

        return (x == v.x) && (y == v.y)
    }

    //returns true if this vector has different values from the given vector
    method !=(v : Vector2) -> Vector2 is public {

        return !((x == v.x) && (y == v.y))
    }

    //returns if the magnitude of this vector is less than the
    //magnitude of the given vector
    method <(v : Vector2) -> Vector2 is public {

        //TODO:
    }

    //returns if the magnitude of this vector is greater than the
    //magnitude of the given vector
    method >(v : Vector2) -> Vector2 is public {

        //TODO:
    }

    //returns the inversion of this vector
    method prefix- -> Vector2 is public {

        return Vector2.new(-x, -y)
    }

    //creates a new 2d vector as the result of adding this vector with
    //the given vector
    method +(v : Vector2) -> Vector2 is public {

        return Vector2.new(x + v.x, y + v.y)
    }

    //creates a new 2d vector as the result of subtracting this vector
    //from the the given vector
    method -(v : Vector2) -> Vector2 is public {

        return Vector2.new(x - v.x, y - v.y)
    }

    //creates a new 2d vector as the result of multiplying the components
    //of this vector by the given scalar
    method *(s : Number) -> Vector2 is public {

        return Vector2.new(x * s, y * s)
    }

    //creates a new 2d vector as the result of dividing the components
    //of this vector by the given scalar
    method /(s : Number) -> Vector2 is public {

        return Vector2.new(x / s, y / s)
    }

    //PUBLIC METHODS
    //creates a new 2d vector as the result of adding the given scalar
    //to this vector
    method addScalar(s : Number) -> Vector2 is public {

        return Vector2.new(x + s, y + s)
    }

    //creates a new 2d vector as the result of subtracting the given scalar
    //from this vector
    method subScalar(s : Number) -> Vector2 is public {

        return Vector2.new(x - s, y - s)
    }

    //returns the vector as a string
    method asString -> String is public {

        return "[" ++ x ++ ", " ++ y ++ "]"
    }
}
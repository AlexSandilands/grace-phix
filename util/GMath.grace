import "math" as math

// Constants
def pi : Number is readable      = 3.14159265358979323846
def half_pi : Number is readable = 1.57079632679489661923
def two_pi : Number is readable  = 6.28318530717958647692

def UnsafeOperation = Error.refine "UnsafeOperation"

//METHODS

// Return the absolute value
method abs(value : Number) -> Number {

    if (value < 0) then {

        return -value

    } else {

        return value
    }
}

// Returns the square root of the given value
method sqrt(value : Number) -> Number {

    value ^ 0.5
}

// Returns the minimum value of the two given values
method min(value : Number, value' : Number) -> Number {

    if (value < value') then {

        return value
    }

    return value'
}

// Returns the maximum value of the two given values
method max(value : Number, value' : Number) -> Number {

    if (value > value') then {

        return value
    }

    return value'
}

// Clamps the given value between the upper and lower thresholds
method clamp(value : Number) between(lower : Number, upper : Number) -> Number {

    if (value < lower) then {

        return lower
    }
    if (value > upper) then {

        return upper
    }

    return value
}

// Clamps the given value so that it is not greater then the given threshold
method clamp(value : Number) below(threshold : Number) -> Number {

    if (value > threshold) then {

        return threshold
    }

    return value
}

// Clamps the given value so that it is not less than the given threshold
method clamp(value : Number) above(threshold : Number) -> Number {

    print(value)
    print(threshold)

    if (value < threshold) then {

        return threshold
    }

    return value
}

// Calculates the factorial of the given input
method fact(value : Number) -> Number {

    if (value == 0) then {

        return 1
    }

    return value * fact(value - 1)
}

// Converts degrees to radians
method toRadians(value : Number) -> Number {

    value * 0.0174532925
}

// Converts radians to degrees
method toDegrees(value : Number) -> Number {

    value * 57.2957795
}

// Normalizes radians to be between 0 and 2pi
method normalizeRadians(value : Number) -> Number {

    var ret := value

    if (ret < 0) then {

        while {ret < 0} do {

            ret := ret + pi
        }

        return ret

    } elseif (ret > pi) then {

        while {ret > pi} do {

            ret := ret - pi
        }

        return ret
    }

    return ret
}

// Binomial Coefficient
method n(n : Number) choose(k : Number) -> Number {

    if((k < 0) || (k > n)) then {

        UnsafeOperation.raise "Must choose a value between 0 and n"
    }

    return fact(n)/(fact(k)*fact(n-k))
}

// Returns the sine of value
method sin(value : Number) -> Number {

    return math.sin(value)
}

// Returns the cosine of value
method cos(value : Number) -> Number {

    return math.cos(value)
}

// Returns the tangent of value
// Undefined on pi/2 and 3pi/2 so will throw an error on these values
method tan(value : Number) -> Number {

    if ((value == half_pi) || (value == (pi/2))) then {

        UnsafeOperation.raise "Tan(pi/2) is undefined"

    } elseif((value == (3*half_pi)) || (value == (3*(pi/2)))) then {

        UnsafeOperation.raise "Tan(3pi/2) is undefined"
    }

    return math.tan(value)
}

// Returns the arcsine of value
method asin(value : Number) -> Number {

    math.asin(value)
}

// Returns the arccosine of value
method acos(value : Number) -> Number {

    math.acos(value)
}

// Returns the arctangent of value
method atan(value : Number) -> Number {

    math.atan(value)
}
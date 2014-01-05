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

//returns the square root of the given value
method sqrt(value : Number) -> Number {

    return value ^ 0.5
}

//returns the minimum value of the two given values
method min(value : Number, value' : Number) -> Number {

    if (value < value') then {

        return value
    }

    value'
}

//returns the maximum value of the two given values
method max(value : Number, value' : Number) -> Number {

    if (value > value') then {

        return value
    }

    value'
}

//clamps the given value between the upper and lower thresholds
method clamp(value : Number) between(lower : Number, upper : Number) -> Number {

    if (value < lower) then {

        return lower
    }
    if (value > upper) then {

        return upper
    }

    value
}

//clamps the given value so that it is not greater then the given threshold
method clamp(value : Number) below(threshold : Number) -> Number {

    if (value > threshold) then {

        return threshold
    }

    value
}

//clamps the given value so that it is not less than the given threshold
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

    value * fact(value - 1)
}

// Converts degrees to radians
method toRadians(value : Number) -> Number {

    return value * 0.0174532925
}

// Converts radians to degrees
method toDegrees(value : Number) -> Number {

    return value * 57.2957795
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

// Uses Taylors series expansion to get an estimate of sine
// This method assumes that the value passed in is already in radians.
// and converts it to a value between 0 and 2pi
method sin(value : Number) -> Number {

    var x := normalizeRadians(value)

    var ret := 0

    for (0 .. 10) do { n ->

        ret := ret + (((-1)^n)*(x^(2*n + 1)))/fact(2*n + 1)
    }


    return ret
}

// Uses Taylors series expansion to get an estimate of cosine
// This method assumes that the value passed in is already in radians.
// and converts it to a value between 0 and 2pi
method cos(value : Number) -> Number {

    var x := normalizeRadians(value)

    var ret := 0

    for (0 .. 10) do { n ->

        ret := ret + (((-1)^n)*(x^(2*n)))/fact(2*n)
    }


    return ret
}

// Uses sin and cos functions to approximate values on tan
// Undefined on pi/2 and 3pi/2 so will throw an error on these values
method tan(value : Number) -> Number {

    if ((value == half_pi) || (value == (pi/2))) then {

        UnsafeOperation.raise "Tan(pi/2) is undefined"

    } elseif((value == (3*half_pi)) || (value == (3*(pi/2)))) then {

        UnsafeOperation.raise "Tan(3pi/2) is undefined"
    }


    return sin(value)/cos(value)
}

// Uses power series expansion to approximate inverse sine values
method aSin(value : Number) -> Number {

    var ret := 0

    for(0 .. 10) do { n ->

        ret := ret + ((n(2*n) choose(n))*(value^(2*n + 1)))/((4^n)*(2*n + 1))
    }


    return ret
}

// Uses arcSine to calculate arcCosine
method aCos(value : Number) -> Number {

    return half_pi - aSin(value)
}

// This approach requires summing millions of times before getting
// close to an accurate answer, which isn't practical on a computer
// Need to find a new method
method aTan(value : Number) -> Number {

    var ret := 0

    for(0 .. 10) do { n ->

        ret := ret + (((-1)^n)*(value^(2*n + 1)))/(2*n + 1)
    }

    return ret
}
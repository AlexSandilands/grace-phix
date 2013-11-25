//METHODS
//returns the square root of the given value
method sqrt(value : Number) {

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

    if(value == 1) then {

        return 1
    }

    value * fact(value - 1)
}

// Uses Taylors series expansion to get an estimate of sine
method sin(value : Number) -> Number {

    var ret := 0

    for(1 .. 50) do { n ->

        ret := ret + (((-1)^n)*(value^(2*n + 1)))/fact(2*n + 1)
    }


    return ret
}
//METHODS
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
method clamp(value : Number)
    between(lowerThreshold : Number, upperThreshold : Number) -> Number {

    if (value < lowerThreshold) then {

        return lowerThreshold
    }
    if (value > upperThreshold) then {

        return upperThreshold
    }

    value
}

//clamps the given value so that it is not greater then the given threshold
method clamp(value : Number)below(threshold : Number) -> Number {

    if (value > threshold) then {

        return threshold
    }

    value
}

//clamps the given value so that it is not less than the given threshold
method clamp(value : Number)above(threshold : Number) -> Number {

    if (value < threshold) then {

        return threshold
    }

    value
}
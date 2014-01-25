
// Constants
def pi : Number is readable      = 3.14159265358979323846
def half_pi : Number is readable = 1.57079632679489661923
def two_pi : Number is readable  = 6.28318530717958647692


//METHODS

// Return the absolute value
method abs(value : Number) -> Number

// Returns the square root of the given value
method sqrt(value : Number) -> Number

// Returns the minimum value of the two given values
method min(value : Number, value' : Number) -> Number

// Returns the maximum value of the two given values
method max(value : Number, value' : Number) -> Number

// Clamps the given value between the upper and lower thresholds
method clamp(value : Number) between(lower : Number, upper : Number) -> Number

// Clamps the given value so that it is not greater then the given threshold
method clamp(value : Number) below(threshold : Number) -> Number

// Clamps the given value so that it is not less than the given threshold
method clamp(value : Number) above(threshold : Number) -> Number

// Calculates the factorial of the given input
method fact(value : Number) -> Number

// Converts degrees to radians
method toRadians(value : Number) -> Number

// Converts radians to degrees
method toDegrees(value : Number) -> Number

// Normalizes radians to be between 0 and 2pi
method normalizeRadians(value : Number) -> Number
// Binomial Coefficient
method n(n : Number) choose(k : Number) -> Number

// Returns the sine of value
method sin(value : Number) -> Number

// Returns the cosine of value
method cos(value : Number) -> Number

// Returns the tangent of value
// Undefined on pi/2 and 3pi/2 so will throw an error on these values
method tan(value : Number) -> Number

// Returns the arcsine of value
method asin(value : Number) -> Number

// Returns the arccosine of value
method acos(value : Number) -> Number

// Returns the arctangent of value
method atan(value : Number) -> Number
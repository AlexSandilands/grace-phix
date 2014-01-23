import "GMath" as math

// Should be 0
print(math.sin(math.pi))

// Should be 1
print(math.sin(math.half_pi))

// Should be 0.707
print(math.sin((3*math.pi)/4))

// Should be 0
print(math.cos(math.pi/2))

// Should be 1
print(math.cos(0))

// Should be -0.707
print(math.cos((3*math.pi)/4))


import "Color" as col

var c1 := col.red
var c2 := col.blue

print("c1: " ++ c1)
print("c2: " ++ c2)
print("c1 + c2: " ++ (c1 + c2))

c1.r := 0.1

print("c1.r := 0.1")
print("c1.brighter: " ++ c1.brighter)

c1.b := 0.8

print("c1.b := 0.8")
print("c1.darker: " ++ c1.darker)


c1 := c1.darker
print("c1 := c1.darker")
print("c1.invert: " ++ c1.invert)

print("c1.grayscale: " ++ c1.grayscale)


import "Vector2" as vec2
import "Vector3" as vec3

var v1 := vec2.setCoords(1.0, 2.0)
var v2 := vec2.setVector2(v1)
var v3 := vec3.setCoords(1, 2, 3)
var v4 := vec2.setVector3(v3)

print(v1)
print(v2)
print(v3)
print(v4)
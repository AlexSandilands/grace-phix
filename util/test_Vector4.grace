import "Vector2" as vec2
import "Vector3" as vec3
import "Vector4" as vec4

var v1 := vec4.setCoords(1, 2, 3, 4)
var v2 := vec2.setCoords(1, 2)
var v3 := vec4.setVector2(v2)
var v4 := vec3.setCoords(1, 2, 3)
var v5 := vec4.setVector3(v4)

print(v1)
print(v3)
print(v5)
import "Vector2" as vec2
import "Vector3" as vec3
import "Vector4" as vec4

var v1 := vec2.setCoords(3, 2)
var v2 := vec3.setCoord(1)Vector2(v1)
var v3 := vec3.zAxis
var v4 := vec3.setVector2(v1)
var v5 := vec4.setCoords(1, 2, 3, 4)
var v6 := vec3.setVector4(v5)

print(v4)
print(v6)
import "Vector2" as vec2
import "Vector3" as vec3
import "Vector4" as vec4

var v1 := vec4.setCoord(1, 2, 3, 4)
var v2 := vec2.setCoord(1, 2)
var v3 := vec4.setVector2(v2)
var v4 := vec3.setCoord(1, 2, 3)
var v5 := vec4.setVector3(v4)
var v6 := vec4.setVector4(v1)
var v7 := vec4.setVector2(v2)Coord(5, 6)
var v8 := vec4.setCoord(0)Vector2(v2)Coord(5)
var v9 := vec4.setCoord(5, 6)Vector2(v2)
var v10 := vec4.setVector2(v2)Vector2(v2)
var v11 := vec4.setVector3(v4)Coord(10)
var v12 := vec4.setCoord(10)Vector3(v4)
var v13 := vec4.xAxis

print(v1)
print(v3)
print(v5)
print(v6)
print(v7)
print(v8)
print(v9)
print(v10)
print(v11)
print(v12)
print(v13)
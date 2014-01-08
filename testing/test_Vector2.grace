import "Vector2" as vec2
import "Vector3" as vec3
import "Vector4" as vec4
import "Math" as math

var v1 := vec2.setCoord(1, 2)
var v2 := vec2.setVector2(v1)
var v3 := vec3.setCoord(1, 2, 3)
var v4 := vec2.setVector3(v3)
var v5 := vec4.setCoord(1, 2, 3, 4)
var v6 := vec2.setVector4(v5)
var v7 := vec2.setCoord(5, 6)
var v8 := vec2.setCoord(1, 1)
var v9 := vec2.setCoord(1, 0)
var v10 := vec2.setCoord(-1, 1)

print(v1)
print(v2)
print(v3)
print(v4)
print(v6)
print(v1 == v6)
print(v1 == v7)
print(v1 != v6)
print(v1 != v7)
print(-v1)
print(v1 + v6)
print(v1 - v6)
print(v1 * 2)
print(v1 / 3)
print(v1.addScalar(5))
print(v1.subScalar(5))
print(v1.magnitude)
print(v1.normalize)
print(v1.dot(v6))
print(v1.toList)
print(v1.distanceTo(v7))
print(v7.clampBetween(0, 1))
print(v7.clampAbove(5.5))
print(v7.clampBelow(5.5))

// Should be 45 degrees
print(math.toDegrees(v8.angleBetween(v9)))
// Should be 135 degrees
print(math.toDegrees(v10.angleBetween(v9)))
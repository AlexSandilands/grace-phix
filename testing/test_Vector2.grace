import "Vector2" as vec2
import "Vector3" as vec3
import "Vector4" as vec4
import "GMath" as math

var v1 := vec2.x(1) y(2)
var v2 := vec2.setVector2(v1)
var v3 := vec3.x(1) y(2) z(3)
var v4 := vec2.setVector3(v3)
var v5 := vec4.x(1) y(2) z(3) w(4)
var v6 := vec2.setVector4(v5)
var v7 := vec2.x(5) y(6)
var v8 := vec2.x(1) y(1)
var v9 := vec2.x(1) y(0)
var v10 := vec2.x(-1) y(1)

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
print(vec2.dot(v1, v6))
print(v1.toList)
print(vec2.distanceBetween(v1, v7))
print(v7.clampBetween(0, 1))
print(v7.clampAbove(5.5))
print(v7.clampBelow(5.5))

// Should be 45 degrees
print(math.toDegrees(vec2.angleBetween(v8, v9)))
// Should be 135 degrees
print(math.toDegrees(vec2.angleBetween(v10, v9)))
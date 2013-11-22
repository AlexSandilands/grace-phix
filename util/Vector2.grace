method zero -> Vector2 {

    Vector2.new(0, 0)
}

method setCoords(x : Number, y : Number) -> Vector2 {

    Vector2.new(x, y)
}

method setVector(v : Vector2) -> Vector2 {

    Vector2.new(v.x, v.y)
}

class Vector2.new(x' : Number, y' : Number) {

    var x : Number is public := x'
    var y : Number is public := y'

    method asString -> String is public {

        "[" ++ x ++ ", " ++ y ++ "]"
    }
}
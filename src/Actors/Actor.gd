extends KinematicBody2D
class_name Actor

export var gravity := 500.0
export var speed := Vector2(300, 1000)
const FLOOR_NORMAL := Vector2.UP

var _velocity: = Vector2.ZERO

extends "res://src/Actors/Actor.gd"

export var score := 100

func _ready():
	set_physics_process(false)
	_velocity.x = -speed.x

func _on_Area2D_body_entered(body: KinematicBody2D):
	if(body.global_position.y > get_node("Area2D").global_position.y):
		return
	get_node("CollisionShape2D").disabled = true
	PlayerData.score += score
	queue_free()
	

func _physics_process(delta):
	_velocity.y += gravity * delta
	if(is_on_wall()):
		_velocity.x *= -1.0
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	

extends Area2D

onready var animationPlayer := get_node("AnimationPlayer")

export var score := 100

func _on_body_entered(body):
	set_collision_mask_bit(0, 0)
	PlayerData.score += score
	animationPlayer.play("Fade")

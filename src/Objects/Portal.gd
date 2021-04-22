tool
extends Area2D

onready var animation_player := $AnimationPlayer

export var next_scene_name : String

func _on_Portal_body_entered(body):
	teleport()

func _get_configuration_warning():
	return "Next scene property can't be empty" if not next_scene_name else ""

func teleport() :
	animation_player.play("fade_in")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(next_scene_name)


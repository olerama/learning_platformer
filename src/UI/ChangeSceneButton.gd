tool
extends Button

export(String, FILE) var next_scene_name := ""
export var reset_score:= false
export var reset_deaths:= false

func _get_configuration_warning():
	return "next_scene_name must be filled" if next_scene_name == "" else ""
func _on_button_up():
	if reset_score:
		PlayerData.score = 0
	if reset_deaths:
		PlayerData.deaths = 0
	get_tree().paused = false
	get_tree().change_scene(next_scene_name)

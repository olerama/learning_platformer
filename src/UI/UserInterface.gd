extends Control

onready var scene_tree: = get_tree()
onready var pause_overlay: = $PauseOverlay
onready var score := $ScoreLabel
onready var pause_title := $PauseOverlay/Text
var paused: = false setget set_paused

const DIED_MESSAGE := "You died"

func _ready():
	PlayerData.connect("score_updated", self, "update_interface")
	PlayerData.connect("player_died", self, "_on_PlayerData_player_died")
	update_interface()

func update_interface():
	score.text = "Score: %s" % PlayerData.score

func _on_PlayerData_player_died():
	pause_title.text = DIED_MESSAGE
	self.paused = true

func _unhandled_input(event):
	if event.is_action_pressed("Pause") and pause_title.text != DIED_MESSAGE:
		self.paused = not paused
		scene_tree.is_input_handled()
		
func set_paused(value: bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value

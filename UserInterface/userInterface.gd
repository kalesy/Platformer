extends Control

onready var scene_tree = get_tree()
onready var paused_overlay: ColorRect = $PauseOverLay
onready var scoreLabel = $ScoreLabel
onready var pausedLabel = $PauseOverLay/pausedLabel

var paused = false setget set_paused

func _PlayerData_player_died():
	self.paused = true
	pausedLabel.text = "You died, and totally %s death this round." % PlayerData.death
	

func _ready():
	if PlayerData.connect("score_updated", self, "update_interface") != OK:
		print("Signal connect error!!!")
	if PlayerData.connect("player_died", self, "_PlayerData_player_died") != OK:
		print("Signal connect error!!!")
	update_interface()

func update_interface():
	scoreLabel.text = "Score: %s" % PlayerData.score

func set_paused(value: bool):
	paused = value
	self.scene_tree.paused = value
	self.paused_overlay.visible = value

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = not paused
		scene_tree.set_input_as_handled()

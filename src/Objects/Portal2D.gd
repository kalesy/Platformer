tool
extends Area2D

onready var animation_player = $AnimationPlayer

export var nextScene : PackedScene

func _get_configuration_warning() -> String:
	return "The next Scene property can't be empty" if not nextScene else ""


func teleport() -> void:
	animation_player.play("fade_in")
	yield(animation_player, "animation_finished")
	get_tree().change_scene_to(nextScene)

func _on_Portal2D_body_entered(_body:Node):
	self.teleport()
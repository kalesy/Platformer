extends Node2D

func _ready():
	$Player.connect("player_dead", self, "_on_player_dead")

func _on_player_dead():
	$Player.set_physics_process(false)
	$Player.set_process(false)

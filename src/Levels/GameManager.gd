extends Node2D

#func _ready():
	#if not $Player.connect("player_dead", self, "_on_player_dead"):
	#	print("Failed to connnect signal to function!!!")

func _on_player_dead():
	$Player.set_physics_process(false)
	$Player.set_process(false)

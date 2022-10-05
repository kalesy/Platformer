extends Area2D

onready var AnimationPlayer = $AnimationPlayer



func _on_Coin_body_entered(_body:Node):
	AnimationPlayer.play("fade_out")
	PlayerData.score += 1000

extends Button

export(String, FILE) var next_scene_path = "res://src/Levels/Level01.tscn"

func _on_ChangeSceneButton_button_up():
	get_tree().change_scene(self.next_scene_path)

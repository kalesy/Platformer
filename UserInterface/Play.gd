extends Button

export(String, FILE) var next_scene_path = "res://src/Levels/Level01.tscn"

func _on_ChangeSceneButton_button_up():
	var tree = get_tree()
	if tree.paused:
		tree.paused = false
	if get_tree().change_scene(self.next_scene_path) != OK:
		print("Failed to load the next scene!!!")

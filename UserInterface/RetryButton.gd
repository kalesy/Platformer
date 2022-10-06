extends Button



func _on_RetryButton_button_up():
    PlayerData.score = 0
    get_tree().paused = false
    if get_tree().reload_current_scene() != OK:
        print("Error reloading current scene!!!")
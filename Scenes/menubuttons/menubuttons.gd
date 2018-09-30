extends Control

func _on_startButton_pressed():
	get_tree().change_scene('res://Scenes/menubuttons/testbuttons.tscn')

func _on_exitButton_pressed():
	get_tree().quit()
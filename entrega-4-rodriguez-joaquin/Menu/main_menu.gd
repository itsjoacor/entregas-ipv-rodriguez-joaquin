extends Control

func _ready():
	pass

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")
	
	
func _on_quit_pressed() -> void:
	get_tree().quit()

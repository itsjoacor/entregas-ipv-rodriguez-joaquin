extends Control

func _ready():
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()

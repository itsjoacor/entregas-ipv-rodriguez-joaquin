extends Control

const LOST_SOUND := preload("res://assets/music/080205_life-lost-game-over-89697.mp3")

func _ready():
	# Optional safety: stop all other audio and unmute master
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

	var sound = AudioStreamPlayer.new()
	sound.stream = LOST_SOUND
	add_child(sound)
	sound.play()






func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")


func _on_button_3_pressed() -> void:
	get_tree().quit()

extends Control

const VICTORY_SOUND := preload("res://assets/music/wongame.wav")

func _ready():
	# Optional safety: ensure master bus is unmuted
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)

	var sound = AudioStreamPlayer.new()
	sound.stream = VICTORY_SOUND
	add_child(sound)
	sound.play()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_button_3_pressed() -> void:
	get_tree().quit()

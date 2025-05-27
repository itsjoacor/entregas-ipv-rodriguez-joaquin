extends Control

func resume() -> void:
	get_tree().paused = false

func pause() -> void:
	get_tree().paused = true

func pauseResume_logic() -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			resume()
		else:
			pause()

func _process(delta: float) -> void:
	pauseResume_logic()

func _on_resume_pressed() -> void:
	resume()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()

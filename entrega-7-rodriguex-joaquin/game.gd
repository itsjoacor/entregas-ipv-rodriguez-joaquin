extends Node2D

@onready var pause_menu := $PauseMenu
@onready var pauseTitle := $PauseMenu/PauseTitle
@onready var background_music := $BackgroundMusic

func _ready() -> void:
	pause_menu.visible = false


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause") and !get_tree().paused:
		_pause_game()

func _pause_game() -> void:
	get_tree().paused = true
	pause_menu.visible = true
	pauseTitle.visible = true

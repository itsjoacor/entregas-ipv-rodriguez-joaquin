extends Control

@onready var resume_button := $CenterContainer/Panel/VBoxContainer/Resume
@onready var restart_button := $CenterContainer/Panel/VBoxContainer/Restart
@onready var quit_button := $CenterContainer/Panel/VBoxContainer/Quit

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

	resume_button.pressed.connect(_on_resume_pressed)
	restart_button.pressed.connect(_on_restart_pressed)
	quit_button.pressed.connect(_on_quit_pressed)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("unpause"):
		get_tree().paused = false
		self.visible = false

func _on_resume_pressed() -> void:
	get_tree().paused = false
	self.visible = false

func _on_restart_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()

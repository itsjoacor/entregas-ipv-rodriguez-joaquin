extends Node2D

@onready var ray_cast = $RayCast2D
@onready var timer = $Timer
@export var ammo : PackedScene

var player
func _ready():
	player = get_parent().find_child("Player")

func _physics_process(_delta):
	_aim()
	_check_player_collision()

func _aim():
	ray_cast.target_position = to_local(player.position)

func _check_player_collision():
	pass

	

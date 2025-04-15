extends CharacterBody2D

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9
var jump_times := 0

func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	if (jump_times < 2) and Input.is_action_just_pressed("jump"):
		velocity.y -= jump
		jump_times += 1
	if is_on_floor():
		jump_times = 0
	velocity.y += gravity
	move_and_slide()




@export var bullet_scene: PackedScene  # Bullet scene reference
@export var fire_rate = 0.5  # Time between shots
var can_shoot = true

# Handle player input for shooting
func _input(event):
	if event.is_action_pressed("shoot") and can_shoot:
		shoot()

func shoot():
	# Instantiate the bullet from the scene
	var bullet = bullet_scene.instantiate()
	
	# Set the bullet's starting position (adjust position based on gun)
	bullet.position = $Gun.position  # Ensure the Gun is a child of Player
	
	# Set bullet's direction
	bullet.direction = Vector2(1, 0)  # Modify if needed for shooting direction
	
	# Add bullet to the scene
	get_tree().current_scene.add_child(bullet)

	# Handle fire rate to avoid rapid firing
	can_shoot = false
	await get_tree().create_timer(fire_rate).timeout  # Using 'await' instead of 'yield'
	can_shoot = true

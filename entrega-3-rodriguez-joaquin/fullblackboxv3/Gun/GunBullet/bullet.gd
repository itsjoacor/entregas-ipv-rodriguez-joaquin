extends Area2D

@export var speed = 400
var direction = Vector2(1, 0) 


func _process(delta):
	position += direction * speed * delta


func _on_Bullet_body_entered(body):
	if body.is_in_group("turrets"):  
		body.queue_free()  
		queue_free() 

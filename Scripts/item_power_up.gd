extends CharacterBody2D

#velocidade da queda
@export var fall_speed = 80

#velocidade de rotação
@export var rotation_speed = 60

func _physics_process(delta):
	#Aplica a velocidade no eixo vertical
	#e incrementa a rotação
	velocity.y = fall_speed
	rotation_degrees += rotation_speed * delta
	
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		var collision_object = collision.get_collider()
		if collision_object.name == "Player":
			GameManager.on_powerup.emit()
			queue_free()

extends Area2D

@export var speed = 100

func _physics_process(delta):
	global_position.y -= speed * delta
	
func _on_body_entered(body):
	print("colidiu")
	GameManager._add_points(1)
	#body.queue_free() #exclui o bloco 
	#queue_free() #exclui o tiro da cena

extends CharacterBody2D

@export var speed = 400
@onready var spawn_shoot: Timer = $SpawnShoot

var max_bullet: int = 20 #máximo de tiros
var current_bullet: int = 0 #controlar quantos tiros foram lançados
var bullet_scene = preload("res://Scenes/bullet.tscn")

func _ready():
	#conecta sinal (passa a ouvi-lo) do powerup
	GameManager.on_powerup.connect(spawn_bullet)
	
func spawn_bullet():
	#cria tiro da esquerda
	var left_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(left_shoot_instance)
	left_shoot_instance.global_position.x = global_position.x - 35
	left_shoot_instance.global_position.y = global_position.y - 20
	
	#cria tiro da direita
	var right_shoot_instance = bullet_scene.instantiate()
	get_parent().add_child(right_shoot_instance)
	right_shoot_instance.global_position.x = global_position.x - 35
	right_shoot_instance.global_position.y = global_position.y - 20
	
	current_bullet += 2
	
	if(current_bullet < max_bullet):
		spawn_shoot.start()
	else:
		spawn_shoot.stop()
		current_bullet = 0
	
func _physics_process(delta):
	print("Pontos: " + str(GameManager.points))
	print("Recorde: " + str(GameManager.record))
	velocity.x = 0
	if Input.is_action_pressed("left") and GameManager.started == true:
		velocity.x -= speed
	if Input.is_action_pressed("right") and GameManager.started == true:
		velocity.x += speed
		
	move_and_collide(velocity * delta)


func _on_spawn_shoot_again():
	spawn_bullet()

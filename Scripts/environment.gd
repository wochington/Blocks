extends Node2D

@onready var timer_reset: Timer = $TimerReset

func _on_death_zone_body_entered(body: Node2D) -> void:
	if body.name == "Ball":
		if GameManager.lives > 1:
			GameManager.lives -= 1
			body.reset_position()
	else:
		GameManager._update_record()#atualiza recorde
		GameManager._reset_points()#reseta pontos
		GameManager._reset_lives()
		timer_reset.start()
		
func _on_timer_reset_timeout() -> void:
	GameManager.started = false
	get_tree().reload_current_scene()

extends CharacterBody2D

var speed = 80

func _physics_process(delta):
	var motion = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = true
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.play("sidewalk")
		$AnimatedSprite2D.flip_h = false
		motion.x = -speed
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite2D.play("downwalk")
		motion.y = speed
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite2D.play("upwalk")
		motion.y = -speed
	else:
		$AnimatedSprite2D.play("idle")
	
	velocity = motion
	move_and_slide()

func player_sell_method():
	pass

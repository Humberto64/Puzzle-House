extends CharacterBody2D
var speed = 100
var current_direct="down"
var score=0
var is_alive=true

func _physics_process(delta):
	
	if Input.is_action_just_pressed("interact"):
		interact(delta)
		current_direct="none"
	else:	
		player_movement(delta)
#funtions for walk/idle movement:
func player_movement(delta):
	if Input.is_action_pressed("right"):
		animation_selec(1)
		current_direct="right"
		velocity.x=speed
		velocity.y=0
	elif Input.is_action_pressed("left"):
		animation_selec(1)
		current_direct="left"
		velocity.x=-speed
		velocity.y=0
	elif Input.is_action_pressed("up"):
		animation_selec(1)
		current_direct="up"
		velocity.x=0
		velocity.y=-speed
	elif Input.is_action_pressed("down"):
		animation_selec(1)
		current_direct="down"
		velocity.x=0
		velocity.y=speed 
	else:
		animation_selec(0)
		velocity.x=0
		velocity.y=0
	move_and_slide()
#funtions to play walk/idle animations:
func animation_selec(movement):
	var dir=current_direct
	var anim = $AnimatedSprite2D
	if dir=="right":
		anim.flip_h= false
		if movement==1:
			anim.play("walk_side")
		elif movement== 0:
			anim.play("idle_side") 
	if dir=="left":
		anim.flip_h= true
		if movement==1:
			anim.play("walk_side")
		elif movement== 0:
			anim.play("idle_side") 	
	if dir=="up":	
		if movement==1:
			anim.play("walk_up")
		elif movement== 0:
			anim.play("idle_up") 
	if dir=="down":
		if movement==1:
			anim.play("walk_down")
		elif movement== 0:
			anim.play("idle_down") 	
#funtions for player stats:
func interact(delta):
		velocity.x=0
		velocity.y=0
		$AnimatedSprite2D.play("dead")
		

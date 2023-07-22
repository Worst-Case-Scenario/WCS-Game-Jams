extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

const max_jump = 2
var current_jump = 0

@onready var animSprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor():
		if velocity.y < 1000:
			velocity.y += gravity
	else:
		current_jump = 0
	
	if Input.is_action_just_pressed("jump"):
		if current_jump < max_jump:
			velocity.y = -jump_force
			current_jump += 1
		
	
	var horizontal_direction = Input.get_axis("move_left","move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	if velocity.y < 0:
		animSprite.play("jump")
	elif velocity.x < 0:
		animSprite.flip_h = true
		animSprite.play("moving")
	elif velocity.x > 0:
		animSprite.flip_h = false
		animSprite.play("moving")
	else:
		animSprite.play("idle")
	

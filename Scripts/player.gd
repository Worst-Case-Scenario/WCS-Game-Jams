extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 300

@onready var animSprite = $AnimatedSprite2D

func _physics_process(delta):
	if !is_on_floor() && velocity.y < 1000:
		velocity.y += gravity
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("move_left","move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	if velocity.y < 0:
		animSprite.play("jump")
	elif velocity.x != 0:
		animSprite.play("moving")
	else:
		animSprite.play("idle")
	
	update_rotation(velocity)

func update_rotation(direction):
	animSprite.flip_h = direction.x < 0

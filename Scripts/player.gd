extends CharacterBody2D

@export var speed = 150
@export var gravity = 30
@export var jump_force = 300
var moving = "right"
@onready var animSprite = $AnimatedSprite2D
var is_moving_left = false
const bulletPath = preload("res://Objects/bullet.tscn")

func _physics_process(delta):
	if !is_on_floor() && velocity.y < 1000:
		velocity.y += gravity
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force 
	
	if Input.is_action_just_pressed("accept"):
		shoot()
	var horizontal_direction = Input.get_axis("move_left","move_right")
	velocity.x = speed * horizontal_direction
	move_and_slide()
	
	if velocity.y < 0:
		animSprite.play("jump")
	elif velocity.x != 0:
		animSprite.play("moving")
	else:
		animSprite.play("idle")
	if Input.is_action_pressed("left") and !is_moving_left:
		is_moving_left = true
		moving = "left"
		scale.x = -scale.x
	elif Input.is_action_pressed("right") and is_moving_left:
		is_moving_left = false
		moving = "right"
		scale.x = -scale.x
	
	
func shoot():
	var bullet = bulletPath.instantiate()
	
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	bullet.velocitys = Vector2(1,0) if moving == "right" else Vector2(-1,0)
	
	

	

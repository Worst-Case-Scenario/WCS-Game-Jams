extends CharacterBody2D

var is_moving_left = true
@export var speed = 100
@export var gravity = 30
@export var jump_force = 300

# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	$enemyanim.play("moving")

func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y += gravity
	
	move_and_slide()

func detect_turn_around():
	if not $GroundDetector.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func _physics_process(delta):
	if $enemyanimplayer.current_animation == "attack":
		
		return
	if $PlayerDetector.is_colliding():
		print("hit2")
		$enemyanimplayer.play("attack")
		$enemyanim.play("idle")
	if $AttackDetector.is_colliding():
		
		get_tree().reload_current_scene()
	move_character()
	detect_turn_around()
	
func hit():
	$AttackDetector.enabled = true

func end_of_hit():
	$AttackDetector.enabled = false
	
func start_walk():
	
	$enemyanim.play("moving")



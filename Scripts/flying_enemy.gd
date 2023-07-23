extends CharacterBody2D

var is_moving_left = false
@export var speed = 100
var get_direction
# Get the gravity from the project settings to be synced with RigidBody nodes.

func _ready():
	$enemyanim.play("flying")

func move_character():
	velocity = Vector2(1, 0).rotated(rotation) * speed
	move_and_slide()

func detect_turn_around():
	if $WallDetector.is_colliding():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func _physics_process(delta):
	if $PlayerDetector.get_overlapping_bodies() != []:
		$enemyanimplayer.play("attack")
		$enemyanim.play("attack")
	move_character()
	detect_turn_around()
	
func facing():
	speed = 0
	look_at((get_node("/root/World/Player").global_position))
	pass
func hit():
	speed = 500
	pass

func end_of_hit():
	speed = 100
	pass
	
func start_walk():
	$enemyanim.play("flying")




func _on_player_detector_body_exited(body):
	
	rotation_degrees = 180 if is_moving_left else 0
	pass # Replace with function body.

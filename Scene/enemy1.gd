extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


var randomnum

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum{
	observe,
	attack,
	hit,
}
var state = observe

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	randomnum = rng.randf()
	
func move(target, delta):
	var direction = (target - global_position).normalized() 
	var desired_velocity =  direction * SPEED
	var steering = (desired_velocity - velocity) * delta * 2.5
	velocity += steering
	move_and_slide()
	
func get_circle_position(random):
	var kill_circle_centre
	if is_instance_valid($Player):
		kill_circle_centre = $Player.global_position
	
	var radius = 40
	var angle = random * PI * 2;
	var x = kill_circle_centre.x + cos(angle) * radius;
	var y = kill_circle_centre.y + sin(angle) * radius;

	return Vector2(x, y)
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	match state:
		observe:
			move(get_circle_position(randomnum), delta)
		attack:
			if is_instance_valid($Player):
				move($Player.global_position, delta)
		hit:
			if is_instance_valid($Player):
				move($Player.global_position, delta)
			print("HIT")
			#Slash ANIM
	move_and_slide()

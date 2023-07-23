extends CharacterBody2D


const speed = 300.0
const JUMP_VELOCITY = -400.0


func _ready():
	velocity = get_global_mouse_position()
func _physics_process(delta):
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	move_and_slide()
	



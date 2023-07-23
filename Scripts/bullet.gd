extends CharacterBody2D

var velocitys = Vector2(1,0)
const speed = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta):
	var collision_info = move_and_collide(velocitys.normalized() * delta * speed)
	move_and_slide()
	



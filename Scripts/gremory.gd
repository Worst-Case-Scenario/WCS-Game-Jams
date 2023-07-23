extends CharacterBody2D

var phase = 0
const bulletPath = preload("res://Objects/grbullet.tscn")
var is_moving_left = false
var attack = false
var speed
func _ready():
	pass


func _physics_process(delta):
	print(phase)
	match phase:
		0 :
			self.global_position.x = get_node("/root/World/Player").global_position.x
			self.global_position.y= get_node("/root/World/Player").global_position.y - 75
			move_and_slide()
		1:
			speed = get_node("/root/World/Player").speed
			self.global_position.x= get_node("/root/World/Player").global_position.x
			self.global_position.y= get_node("/root/World/Player").global_position.y - 75
			
			
	
	
func end_idle():
	match phase:
		0:
			$enemyanimplayer.play("phase1")
		1:
			$enemyanimplayer.play("phase2")
		2:
			$enemyanimplayer.play("phase3")
		3:
			$enemyanimplayer.play("phase4")
	phase += 1
		
	
func phase1shoot():
	var target = self.global_position.direction_to(get_node("/root/World/Player").global_position)
	var bullet = bulletPath.instantiate()
	var bullet2 = bulletPath.instantiate()
	var bullet3 = bulletPath.instantiate()
	var bullet4= bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $spawn1.global_position
	bullet.velocity = target
	bullet.look_at(target)
	get_parent().add_child(bullet2)
	bullet2.position = $spawn2.global_position
	bullet2.velocity = target
	bullet2.look_at(target)
	get_parent().add_child(bullet3)
	bullet3.position = $spawn3.global_position
	bullet3.velocity = target
	bullet3.look_at(target)
	get_parent().add_child(bullet4)
	bullet4.position = $spawn4.global_position
	bullet4.velocity = target
	bullet4.look_at(target)
	
func start_walk():
	$enemyanim.play("idle")
	
	
func end_of_hit():
	print("pings")
	
func _on_player_detector_body_entered(body):
	attack = true
	

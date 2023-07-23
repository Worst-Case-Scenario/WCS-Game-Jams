extends CharacterBody2D

const bulletPath = preload("res://Objects/bullet.tscn")
var is_moving_left = false
var attack = false
func _ready():
	pass


func _physics_process(delta):
	if $enemyanimplayer.current_animation == "attack":
		return
	if $PlayerDetector.get_overlapping_bodies() != []:
		$enemyanimplayer.play("attack")
		$enemyanim.play("attack")
	if !is_moving_left and get_node("/root/World/station_enem").global_position.direction_to(get_node("/root/World/Player").global_position).x > 0:
		is_moving_left = true
		scale.x = -scale.x
	elif is_moving_left and get_node("/root/World/station_enem").global_position.direction_to(get_node("/root/World/Player").global_position).x < 0:
		is_moving_left = false
		scale.x = -scale.x
	
	
func start_walk():
	$enemyanim.play("idle")

func hit():
	print(get_node("/root/World/station_enem").global_position.direction_to(get_node("/root/World/Player").global_position))
	var bullet = bulletPath.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Marker2D.global_position
	bullet.velocity = get_node("/root/World/station_enem").global_position.direction_to(get_node("/root/World/Player").global_position)
	
func end_of_hit():
	print("pings")
	
func _on_player_detector_body_entered(body):
	attack = true
	

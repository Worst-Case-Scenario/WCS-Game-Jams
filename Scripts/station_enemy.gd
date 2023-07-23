extends CharacterBody2D

const bulletPath = preload("res://Objects/bullet.tscn")

func _ready():
	pass


func _physics_process(delta):
	if $enemyanimplayer.current_animation == "attack":
		return
	
func start_walk():
	$enemyanim.play("idle")

func shoot():
	var bullet = bulletPath.instance()
	
	get_parent().add_child(bullet)
	bullet.position = $Marked2D.global_position
	


func _on_player_detector_body_entered(body):
	print("hits")
	$enemyanimplayer.play("attack")
	$enemyanim.play("attack")

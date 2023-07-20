extends VBoxContainer

var fadein = false
var fadeout = false
var next_room = false
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$disclaimer.modulate.a = -2
	$logo.modulate.a = -2
	fadein = true

var i = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#changing the text for splash screen
	if i == 0:
		if fadein:
			if $logo.modulate.a < 1:
				$logo.modulate.a += 3*delta
			if $logo.modulate.a >= 1:
				timer += delta
		if timer > 2:
			fadein = false
			fadeout = true
		if fadeout:
			$logo.modulate.a -= 3*delta
		if $logo.modulate.a <= -1 and fadeout:
			fadeout = false
			fadein = true
			timer = 0
			i += 1
	elif i == 1:
		if fadein:
			if $disclaimer.modulate.a < 1:
				$disclaimer.modulate.a += 3*delta
			if $disclaimer.modulate.a >= 1:
				timer += delta
		if timer > 2:
			fadein = false
			fadeout = true
		if fadeout:
			$disclaimer.modulate.a -= 3*delta
		if $disclaimer.modulate.a <= -1 and fadeout:
			fadeout = false
			fadein = true
			i += 1
	else:
		get_tree().change_scene_to_file("res://Scene/title.tscn")

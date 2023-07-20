extends VBoxContainer

var fadein = true
var fadeout = false
var next_room = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$disclaimer.modulate.a = -2
	$logo.modulate.a = -2

var i = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#changing the text for splash screen
	if i == 0:
		if fadein:
			$logo.modulate.a += 3*delta
		if $logo.modulate.a >= 4:
			fadein = false
			fadeout = true
		if fadeout:
			$logo.modulate.a -= 3*delta
		if $logo.modulate.a <= -1 and fadeout:
			fadeout = false
			fadein = true
			i += 1
	elif i == 1:
		if fadein:
			$disclaimer.modulate.a += 3*delta
		if $disclaimer.modulate.a >= 4:
			fadein = false
			fadeout = true
		if fadeout:
			$disclaimer.modulate.a -= 3*delta
		if $disclaimer.modulate.a <= -1 and fadeout:
			fadeout = false
			fadein = true
			i += 1
	else:
		get_tree().change_scene_to_file("res://main.tscn")

extends Control

var pos = 0
var menu_length = 3
var fadeOut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print("ping")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var down = int(Input.is_action_just_pressed("down"))
	var up = int(Input.is_action_just_pressed("up"))
	print(int(Input.is_action_just_pressed("up")))
	if not fadeOut:
		pos += down - up
	if pos >= menu_length:
		pos = 0
	if pos < 0:
		pos = menu_length - 1

	match pos:
		0:	
			#Gunanya untuk mengganti warna apabila posisi berada di angka tersebut
			$Mulai.set("theme_override_colors/font_color", Color(1, 0, 0))
			$Keluar.set("theme_override_colors/font_color", Color(1,1,1))
			$Pengaturan.set("theme_override_colors/font_color", Color(1,1,1))

		1:
			$Mulai.set("theme_override_colors/font_color", Color(1,1,1))
			$Pengaturan.set("theme_override_colors/font_color", Color(1, 0, 0))
			$Keluar.set("theme_override_colors/font_color", Color(1,1,1))
		2:
			$Mulai.set("theme_override_colors/font_color", Color(1,1,1))
			$Keluar.set("theme_override_colors/font_color", Color(1, 0, 0))
			$Pengaturan.set("theme_override_colors/font_color", Color(1,1,1))

	if Input.is_action_just_pressed("accept"):
		fadeOut = true
	if fadeOut:
		modulate.a -= 2*delta
	if modulate.a <= -1:
		match pos:
			0: 
				get_tree().change_scene_to_file("res://Scene/Main.tscn")
			1:
				pass
			2:
				get_tree().quit()

	pass


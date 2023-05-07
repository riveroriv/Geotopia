extends Node2D

onready var current_scene = null
var next_scene = null
var is_paused = false


func _ready():
	change_scene("res://scenes/screens/Menu.tscn")

func change_scene(scene_path, extra = null):
	next_scene = load(scene_path).instance()
	if next_scene.name == 'GameOver' or next_scene.name == "Game":
		next_scene.extra = extra
	if current_scene:
		current_scene.queue_free()
	add_child(next_scene)
	current_scene = next_scene
	
func _input(event):
	pass
	
#	if event.is_action_pressed("pause"):
#		is_paused = !is_paused
#		if is_paused:
#			get_tree().paused = true # Pause the entire scene tree
#			$Pause.show() # Show the pause screen
#		else:
#			# The game is already unpaused, so do nothing
#			pass

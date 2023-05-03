extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Salir_pressed():
	get_tree().quit()

#var menu_scene = preload("res://scenes/screens/Menu.tscn")
func _on_Menu_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Menu.tscn")


func _on_Continue_pressed():
	hide()

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = false # Resume the scene tree
		get_parent().is_paused = false # Update the is_paused flag in the parent node
		hide() # Hide the pause screen

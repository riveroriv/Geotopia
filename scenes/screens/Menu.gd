extends Node2D


func _ready():
	$Player.visible_label(false)
	$Player/Body/Camera2D.zoom.x = 1
	$Player/Body/Camera2D.zoom.y = 1
	$Player.shoots=9999
		
func _physics_process(delta):
	pass


func _on_Salir_pressed():
	get_tree().quit()


func _on_Jugar_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Game.tscn")

extends Node2D


func _ready():
	$Player.visible_label(false)
		
func _physics_process(delta):
	pass


func _on_Salir_pressed():
	get_tree().quit()


func _on_Jugar_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Game.tscn")

extends Node2D


func _ready():
	pass
		
func _physics_process(delta):
	print($Navigation2D/Map/Enemies.get_child_count())

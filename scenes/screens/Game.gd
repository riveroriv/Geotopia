extends Node2D

var level
var extra

func _ready():
	if extra != null:
		level = extra[0]
	else:
		level = 1
	# esto está así porque pide que sean constantes
	var map
	print(level)
	if level == 1:
		map = preload('res://scenes/maps/Map_1.tscn').instance()
	if level == 2:
		map = preload('res://scenes/maps/Map_2.tscn').instance()
	if level == 3:
		map = preload('res://scenes/maps/Map_3.tscn').instance()
	$Navigation2D.add_child(map)
		
func _process(delta):
	if $Navigation2D/Map/Enemies.get_child_count() == 0:
		end_level()

func end_level():
	get_node("/root/Main").change_scene("res://scenes/screens/GameOver.tscn", [$Player.deaths, level])

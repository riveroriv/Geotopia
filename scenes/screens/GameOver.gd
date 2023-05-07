extends Node2D


onready var label_deaths = $Control/Deaths

var time = 0
var deaths = 0
var i = 0
var extra
var level


const FINAL = 3

func _ready():
	deaths = extra[0]
	level = extra[1]
	if level == FINAL:
		$Control/Next.text = "Menu"


func _process(delta):
	if i == deaths and time < 1:
		label_deaths.text = str(i)
		return
	else:
		if time < 1:
			label_deaths.text = str(i)
			time = 6
			i += 1
		time -= 1


func _on_TryAgain_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Game.tscn", [level])


func _on_Next_pressed():
	if level == FINAL:
		get_node("/root/Main").change_scene("res://scenes/screens/Menu.tscn")
	else:
		get_node("/root/Main").change_scene("res://scenes/screens/Game.tscn", [level+1])

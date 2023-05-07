extends Node2D

var initial_shoots = 2
var deaths = 0
var bullets = []
var shoots = initial_shoots
var time_shoot = 2 * 60
var last_shoot = 0

onready var label_shoots = $Body/Camera2D/CanvasLayer/Control/Label

func _ready():
	pass
	

func _physics_process(delta):
	label_shoots.text = str(shoots)
	if Input.is_action_just_pressed("attack") and shoots > 0:
		shoot()

func shoot():
	var bullet = preload("res://scenes/attacks/Bullet_player.tscn").instance()
	bullet.shoot($Body.position, $Body.rotation)
	shoots -= 1
	$Attacks.add_child(bullet)
	

func visible_label(visible):
	$Body/Camera2D/CanvasLayer/Control/Label.visible=false

func add_shoots(n=1):
	shoots += n

func _on_Checkpointbox_area_entered(area):
	shoots+=1

func _on_Hurtbox_area_entered(area):
	deaths += 1
	shoots = initial_shoots

func _on_Munitionbox_area_entered(area):
	shoots += 1

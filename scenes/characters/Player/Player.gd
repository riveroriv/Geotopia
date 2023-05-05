extends Node2D


var bullets = []
var shoots = 5
var time_shoot = 2 * 60
var last_shoot = 0


func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()

func shoot():
	var bullet = preload("res://scenes/attacks/Bullet_player.tscn").instance()
	bullet.shoot($Body.position, $Body.rotation)
	$Attacks.add_child(bullet)

func _ready():
	pass

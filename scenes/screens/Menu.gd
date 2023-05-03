extends Node2D


var bullets = []
var shoots = 5
var time_shoot = 2 * 60
var last_shoot = 0

func _ready():
	pass
		
func _physics_process(delta):

	if Input.is_action_just_pressed("attack"):
		shoot()
		
func shoot():
	if shoots > 0:
		var bullet = preload("res://scenes/attacks/Bullet_player.tscn").instance()
		bullet.shoot($Player.position, $Player.rotation)
		bullets.append(bullet)
		add_child(bullet)
		shoots-=1

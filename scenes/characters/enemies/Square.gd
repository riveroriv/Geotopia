extends Node2D


func _ready():
	pass
		
func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	#if $Player.position.length() > 400:
	#	$Player.position = -$Player.position
		
func shoot():
	for i in range(8):
		var bullet = preload("res://scenes/attacks/Bullet_square.tscn").instance()
		bullet.shoot($Body.position, $Body.rotation + deg2rad(45*i))
		$Attacks.add_child(bullet)


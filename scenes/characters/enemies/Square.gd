extends Node2D


func _ready():
	pass
		
func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	#if $Player.position.length() > 400:
	#	$Player.position = -$Player.position
		
func shoot():
	for i in range(4):
		var bullet = preload("res://scenes/attacks/Bullet_square.tscn").instance()
		bullet.shoot($Body.position, $Body.rotation + deg2rad(90*i))
		$Attacks.add_child(bullet)



func _on_Timer_timeout():
	shoot()
	var duration = rand_range(1, 4)
	$Timer.start(duration)

extends Node2D


func _ready():
	pass
		
func _physics_process(delta):
	pass

func shoot():
	for i in range(36):
		var bullet = preload("res://scenes/attacks/Bullet_square.tscn").instance()
		bullet.shoot($Body.position, deg2rad(10*i))
		$Attacks.add_child(bullet)



func _on_Timer_timeout():
	var duration = 1
	if $Body.attack:
		shoot()
		duration = rand_range(2, 3)
		
	$Timer.start(duration)

func _on_Hurtbox_area_entered(area):
	$Body.queue_free()
	$Timer.queue_free()

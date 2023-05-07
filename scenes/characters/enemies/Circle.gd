extends Node2D


var alive = true

func _ready():
	pass
		
func _physics_process(delta):
	if not alive and $Attacks.get_child_count() == 0:
		queue_free()

func shoot():
	for i in range(36):
		var bullet = preload("res://scenes/attacks/Bullet_circle.tscn").instance()
		bullet.shoot($Body.position, deg2rad(10*i))
		$Attacks.add_child(bullet)



func _on_Timer_timeout():
	var duration = 1
	if $Body.attack:
		shoot()
		duration = rand_range(3, 5)
		
	$Timer.start(duration)

func _on_Hurtbox_area_entered(area):
	alive = false
	$Body.queue_free()
	$Timer.queue_free()

extends Node2D


var alive = true

func _ready():
	pass
		
func _physics_process(delta):
	if not alive and $Attacks.get_child_count() == 0:
		queue_free()

func shoot():
	for i in range(8):
		var bullet = preload("res://scenes/attacks/Bullet_square.tscn").instance()
		bullet.shoot($Body.position, $Body.rotation + deg2rad(45*i))
		$Attacks.add_child(bullet)



func _on_Timer_timeout():
	if $Body.attack:
		shoot()
	var duration = rand_range(2, 4)
	$Timer.start(duration)


func _on_Hurtbox_area_entered(area):
	alive = false
	$Body.queue_free()
	$Timer.queue_free()

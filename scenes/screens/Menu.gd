extends Node2D


var bullets = []

func _ready():
	pass
		
func _physics_process(delta):
	if Input.is_action_just_pressed("attack"):
		shoot()
	if $Player.position.length() > 400:
		$Player.position = -$Player.position
		
func shoot():
	var bullet = preload("res://scenes/attacks/Bullet_player.tscn").instance()
	bullet.shoot($Player.position, $Player.rotation)
	bullets.append(bullet)
	add_child(bullet)


func _on_Salir_pressed():
	get_tree().quit()


func _on_Jugar_pressed():
	get_node("/root/Main").change_scene("res://scenes/screens/Game.tscn")

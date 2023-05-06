extends KinematicBody2D


onready var start_position = global_position
onready var target_position = global_position
onready var player = get_node("/root/Main/Game/Player/Body")
onready var timer = $Timer

export(int) var move_range = 300

var speed = 300
var accel = 300
var velocity = Vector2.ZERO
var attack = false


func _physics_process(delta):
	var direction = global_position.direction_to(target_position).normalized()
	
	if global_position.distance_to(target_position) > 200:
		velocity = velocity.move_toward(direction * speed, accel * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, accel * delta)
	rotation = velocity.angle()
	
	velocity = move_and_slide(velocity)
	
func _on_Timer_timeout():
	target_position = player.position
	attack = true
	if global_position.distance_to(target_position) > 500 :
		attack = false
		target_position = Vector2(rand_range(move_range/2, move_range), rand_range(move_range/2, move_range))
	
	var duration = rand_range(1, 2)
	timer.start(duration)

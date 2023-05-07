extends KinematicBody2D


onready var target_position = global_position
onready var player = get_node("/root/Main/Game/Player/Body")
onready var navigation = get_node("/root/Main/Game/Navigation2D")

var move_range = 500
var speed = 200
var path = []
var current_waypoint = 0
var attack = false

func _physics_process(delta):
	if path.size() == 0:
			return
	var direction = (path[current_waypoint] - global_position).normalized()
	var velocity = direction * speed
	velocity = move_and_slide(velocity)
	rotation = global_position.direction_to(player.position).angle()
	if global_position.distance_to(path[current_waypoint]) < 10:
		current_waypoint += 1
	if current_waypoint >= path.size():
		calc_path(get_random_target())

func _on_Timer_timeout():
	attack = global_position.distance_to(player.position) < 500
	if attack:
		calc_path(player.position)
	else:
		calc_path(get_random_target())
	var duration = rand_range(2, 3)
	$Timer.start(duration)

func calc_path(target):
	path = navigation.get_simple_path(global_position, target, false)
	current_waypoint=0

func get_random_target():
	return Vector2(
			global_position.x + rand_range(-move_range, move_range),
			global_position.x + rand_range(-move_range, move_range)
			)

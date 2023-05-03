extends KinematicBody2D


export var angle = 0
var speed = 1000
var motion = Vector2.ZERO

func _ready():
	pass
	
func _physics_process(delta):
	motion = Vector2(
		cos(angle),
		sin(angle)
		) * speed
	motion = move_and_slide(motion)
	
func stop():
	speed = 0
	hide()

func shoot(new_position, new_angle):
	speed = 1000
	position = new_position
	angle = new_angle
	show()

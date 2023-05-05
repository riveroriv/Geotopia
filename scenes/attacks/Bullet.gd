extends KinematicBody2D

const _speed = 1000
export var angle = 0
var speed = _speed
var motion = Vector2.ZERO

func _ready():
	rotation = angle
	
func _physics_process(_delta):
	motion = Vector2(
		cos(angle),
		sin(angle)
		) * speed
	motion = move_and_slide(motion)

func shoot(new_position, new_angle):
	speed = _speed
	position = new_position
	angle = new_angle
	show()

func _on_Hitbox_area_entered(_area):
	queue_free()


func _on_Hitbox_body_entered(_body):
	queue_free()

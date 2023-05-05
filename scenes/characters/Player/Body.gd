extends KinematicBody2D


const ACCEL = 1500
const MAX_SPEED = 1000
const FRICTION = 500


var hp = 3
var velocity = Vector2.ZERO
#onready var state_machine = $AnimationTree.get("parameters/playback")
var hurt = false
var on_damage = false


func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - position).normalized()
	var angle = direction.angle()
	rotation = angle
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector  * MAX_SPEED, ACCEL * delta)
	#	state_machine.travel("move")
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#	state_machine.travel("idle")
		
	#if Input.is_action_just_pressed("attack"):
	#	pass
	#	state_machine.travel("hurt")
		
	#if Input.is_action_just_pressed("dash"):
	#	pass
	#	state_machine.travel("hurt")
	#if Input.is_action_just_pressed("roll"):
	#	state_machine.travel("roll")

		
	velocity = move_and_slide(velocity)
	

func _ready():
	pass


func _on_Hurtbox_area_entered(_area):
	print("ouch")

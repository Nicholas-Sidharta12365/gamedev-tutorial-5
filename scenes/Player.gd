extends KinematicBody2D

signal knockback

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600
export (int) var jump_count = 0
export (bool) var is_dash = false

const dash_mult = 2
const UP = Vector2(0,-1)

var velocity = Vector2()
var knockback_dir = Vector2()
var knockback_wait = 50
var dir = 1

func get_input():
	var animation = "diri_kanan"
	velocity.x = 0
	
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		$JumpSound.play()
		yield(get_tree().create_timer(0.9), "timeout")
		$JumpSound.stop()
		
	if Input.is_action_pressed('ui_right'):
		velocity.x += speed
		animation = "jalan_kanan"
		dir = 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= speed
		dir = -1
	if $AnimatedSprite.animation != animation:
		$AnimatedSprite.play(animation)
		
	for body in $Area2D.get_overlapping_bodies():
		if knockback_wait <= 0 and body.name == "Object":
			emit_signal("knockback")
			knockback_wait = 50
			$AudioStreamPlayer2D.play()
			yield(get_tree().create_timer(0.9), "timeout")
			$AudioStreamPlayer2D.stop()
	knockback_wait -= 1

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)

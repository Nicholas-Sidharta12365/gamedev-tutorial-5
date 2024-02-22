extends KinematicBody2D

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600
export (int) var jump_count = 0
export (bool) var is_dash = false

const dash_mult = 2
const UP = Vector2(0,-1)

var velocity = Vector2()

func get_input():
	velocity.x = 0
	
	if is_on_floor() and velocity.x == 0:
		$Sprite.texture = load('res://assets/idle.png')
			
	if is_on_floor() and Input.is_action_pressed("ui_down"):
		$Sprite.texture = load('res://assets/slide.png')
		
	if Input.is_action_pressed('ui_right'):
		if is_on_floor():
			$Sprite.texture = load("res://assets/walk.png")
			$Sprite.flip_h = false
		velocity.x += speed
		if is_on_floor() and Input.is_action_pressed("ui_down"):
			$Sprite.texture = load('res://assets/slide.png')
			velocity.x += speed *2
	if Input.is_action_pressed('ui_left'):
		if is_on_floor():
			$Sprite.texture = load("res://assets/walk.png")
			$Sprite.flip_h = true
		velocity.x -= speed
		if is_on_floor() and Input.is_action_pressed("ui_down"):
			$Sprite.texture = load('res://assets/slide.png')
			velocity.x -= speed *2
			
	if !is_on_floor() and Input.is_action_pressed('ui_dash'):
		$Sprite.texture = load('res://assets/dash.png')
		velocity.x *= dash_mult
			
	if Input.is_action_just_pressed("ui_up"):
		$Sprite.texture = load('res://assets/jump.png')
		if(jump_count < 2):
			velocity.y = jump_speed
			jump_count += 1
		else:
			jump_count = 0

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)

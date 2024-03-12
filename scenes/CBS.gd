extends KinematicBody2D

var velocity = Vector2.ZERO
var move_timer
var animated_sprite
var direction = 1

var knockback_dir
var knockback

func _ready():
	move_timer = Timer.new()
	add_child(move_timer)
	move_timer.wait_time = rand_range(1, 3)
	move_timer.connect("timeout", self, "_on_move_timer_timeout")
	move_timer.start()
	animated_sprite = $AnimatedSprite

func _physics_process(delta):
	velocity.y += delta * 400 
	move_and_slide(velocity, Vector2.UP)
	
	if knockback == true:
		velocity.y = -300
		velocity.x = 300 * knockback_dir
		knockback = false

	if velocity.x == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walking")

	if velocity.x < 0:
		direction = -1
	elif velocity.x > 0:
		direction = 1
	animated_sprite.flip_h = direction > 0

func _on_move_timer_timeout():
	direction = rand_range(-1, 1) 
	velocity.x = direction * 100 
	move_timer.wait_time = rand_range(1, 3) 
	move_timer.start()

func _on_Player_knockback() -> void:
	var player_dir = get_parent().get_node("Player").dir
	knockback_dir = player_dir
	direction = knockback_dir * -1
	knockback = true

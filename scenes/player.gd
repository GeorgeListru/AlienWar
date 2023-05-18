extends CharacterBody2D

@export var speed = 500
var rocket_src = preload("res://scenes/rocket.tscn")
@onready var rockets_layer = $RocketsLayer
@onready var timer = $Timer
var can_shoot = true
signal took_damage

func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()
	var screen_size = get_viewport_rect().size
#	if global_position.x <= 0:
#		global_position.x = 0
#	if global_position.x >= 1280:
#		global_position.x = 1280
#	if global_position.y <= 0:
#		global_position.y = 0
#	if global_position.y >= 720:
#		global_position.y = 720
	
#	global_position.x = clampf(global_position.x, 0, screen_size.x)
#	global_position.y = clampf(global_position.y, 0, screen_size.y)
	
	global_position = global_position.clamp(Vector2(0,0),screen_size)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	if can_shoot:
		var rocket_instance = rocket_src.instantiate()
		rockets_layer.add_child(rocket_instance)
		rocket_instance.global_position = global_position
		rocket_instance.global_position.x += 75
		timer.start()
		can_shoot=false


func _on_timer_timeout():
	can_shoot=true
	

func take_damage():
	emit_signal("took_damage")
	

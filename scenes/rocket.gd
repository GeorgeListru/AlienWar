extends Area2D

@export var speed = 250
@onready var visible_notifier = $VisibleOnScreenNotifier2D

func _physics_process(delta):
	global_position.x+=speed * delta
	speed *= 1.1
	if speed > 2000:
		speed = 2000


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	area.die()
	queue_free()

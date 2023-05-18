extends Node2D

@export var lives = 3
@onready var player = $Player
@export var score = 0

func _on_area_2d_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives-=1
	if lives == 0:
		player.queue_free()


func _on_enemy_spawner_enemy_spawned(enemy):
	enemy.connect("enemy_died", _on_enemy_died)

func _on_enemy_died():
	score+=10
	print(score)

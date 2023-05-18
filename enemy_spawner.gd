extends Node2D

var enemy_src = preload("res://scenes/enemy.tscn")
@onready var enemies = $Enemies
@onready var enemies_positions = $EnemiesPositions
signal enemy_spawned(enemy)

func _on_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var random_position = enemies_positions.get_children().pick_random().global_position
	var enemy = enemy_src.instantiate()
	enemies.add_child(enemy)
	emit_signal("enemy_spawned", enemy)
	enemy.global_position = random_position

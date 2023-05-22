extends Node2D

@export var lives = 3
@onready var player = $Player
@onready var hud = $UI/HUD
@export var score = 0
var game_over_ui_src = preload("res://scenes/game_over_ui.tscn")

@onready var enemy_death_sound = $EnemyDeathSound
@onready var rocket_shot_sound = $RocketShotSound
@onready var player_damage_sound = $PlayerDamageSound

func _ready():
	hud.set_score_label(score)

func _on_area_2d_area_entered(area):
	area.queue_free()


func _on_player_took_damage():
	lives-=1
	hud.set_lives_label(lives)
	player_damage_sound.play()
	if lives == 0:
		player.queue_free()
		
		await get_tree().create_timer(1).timeout
		
		var game_over_ui = game_over_ui_src.instantiate()
		$UI.add_child(game_over_ui)
		game_over_ui.set_final_score_label(score)


func _on_enemy_spawner_enemy_spawned(enemy):
	enemy.connect("enemy_died", _on_enemy_died)

func _on_enemy_died():
	score+=10
	hud.set_score_label(score)
	enemy_death_sound.play()


func _on_player_rocket_shoot():
	rocket_shot_sound.play()

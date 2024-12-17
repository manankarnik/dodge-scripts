extends Node2D

const ENEMY = preload("res://enemy.tscn")
const COLLECTIBLE = preload("res://collectible.tscn")

@onready var path_follow_2d: PathFollow2D = $Path2D/PathFollow2D
@onready var score_timer: Timer = $ScoreTimer
@onready var score_label: Label = $ScoreLabel
@onready var collectible_spawn_rate_timer: Timer = $CollectibleSpawnRateTimer


func _ready() -> void:
	randomize()
	Global.score = 0
	score_timer.start()
	collectible_spawn_rate_timer.start()


func _on_enemy_spawn_rate_timer_timeout() -> void:
	var enemy = ENEMY.instantiate()
	path_follow_2d.progress_ratio = randf()
	enemy.position = path_follow_2d.position
	enemy.rotation = (path_follow_2d.rotation + PI/2) + randf_range(-PI/4, PI/4)
	enemy.velocity = Vector2.RIGHT.rotated(enemy.rotation) * randf_range(600, 800)
	add_child(enemy)


func _on_score_timer_timeout() -> void:
	Global.score += 1
	score_label.text = "Score: " + str(Global.score)


func _on_collectible_spawn_rate_timer_timeout() -> void:
	var collectible = COLLECTIBLE.instantiate()
	var screen_size = get_viewport_rect().size
	collectible.position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
	add_child(collectible)

extends Control

@onready var score_label: Label = $ScoreLabel
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _ready() -> void:
	score_label.text = "Score: " + str(Global.score)
	audio_stream_player_2d.play()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

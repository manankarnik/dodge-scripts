extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	Global.score += 5
	audio_stream_player_2d.play()
	visible = false


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()


func _on_despawn_timer_timeout() -> void:
	queue_free()

extends CharacterBody2D
class_name Player

const SPEED = 800.0


func _physics_process(delta: float) -> void:
	var direction := Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down")).normalized()
	if direction:
		velocity = direction * SPEED
	
	if not direction.x:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if not direction.y:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var collision = get_last_slide_collision()
	if collision:
		get_tree().change_scene_to_file("res://game_over.tscn")
	
	move_and_slide()

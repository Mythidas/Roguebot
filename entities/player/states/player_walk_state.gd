extends PlayerState
class_name PlayerWalkState

func physics_update(delta: float) -> void:
	player.apply_movement(player.input.move_direction * 75.0, delta)

func update(_delta: float) -> void:
	if player.input.move_direction == Vector2.ZERO:
		machine.change_to("idle")

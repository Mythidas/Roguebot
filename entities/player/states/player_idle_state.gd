extends PlayerState
class_name PlayerIdleState

func physics_update(delta: float) -> void:
	player.apply_movement(Vector2.ZERO, delta)

func update(_delta: float) -> void:
	if player.input.move_direction != Vector2.ZERO:
		machine.change_to("walk")

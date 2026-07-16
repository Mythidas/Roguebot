extends PlayerState
class_name PlayerFallState

func physics_update(delta: float) -> void:
	player.apply_movement(player.input.move_direction * 175.0, delta)

func update(_delta: float) -> void:
	if player.is_on_floor():
		if player.input.move_direction == Vector2.ZERO:
			machine.change_to("idle")
		else: machine.change_to("walk")

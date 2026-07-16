extends PlayerState
class_name PlayerJumpState

func enter() -> void:
	player.velocity.y = -300.0
	player.conditions.lock(PlayerConditions.Action.JUMP)
	player.conditions.set_mode(PlayerConditions.Mode.JUMP, true)

func exit() -> void:
	player.conditions.unlock(PlayerConditions.Action.JUMP)
	player.conditions.set_mode(PlayerConditions.Mode.JUMP, false)

func physics_update(delta: float) -> void:
	player.apply_movement(player.input.move_direction * 175.0, delta)

func update(_delta: float) -> void:
	if player.velocity.y >= 0.0:
		machine.change_to("fall")

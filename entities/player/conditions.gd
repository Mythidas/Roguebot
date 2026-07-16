extends Node
class_name PlayerConditions

enum Action {
	MOVE,
	ATTACK,
	JUMP,
	INTERACT,
	ANIMATE
}

enum Mode {
	SPRINT,
	JUMP,
	ATTACK
}

var locks := {}
var modes := {}

func lock(action: Action) -> void:
	locks[action] = locks.get(action, 0) + 1

func unlock(action: Action) -> void:
	if locks.has(action) and locks[action] == 1:
		locks.erase(action)
	elif locks.has(action):
		locks[action] = locks[action] - 1

func can(action: Action) -> bool:
	return not locks.has(action)

func set_mode(mode: Mode, enabled: bool) -> void:
	if enabled: modes[mode] = true
	else: modes.erase(mode)

func is_mode(mode: Mode) -> bool:
	return modes.has(mode)

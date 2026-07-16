extends RefCounted
class_name StateMachine

var states: Dictionary = {}
var current: State

func add_state(name: String, state: State) -> void:
	state.machine = self
	states[name] = state

func change_to(name: String) -> bool:
	if !states.has(name): return false
	if current: current.exit()
	
	current = states[name]
	current.enter()
	return true

func update(delta: float) -> void:
	if current: current.update(delta)

func physics_update(delta: float) -> void:
	if current: current.physics_update(delta)

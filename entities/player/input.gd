extends Node
class_name PlayerInput

var move_direction: Vector2 = Vector2.ZERO

signal menu_pressed
signal jump_pressed
signal attack01_pressed
signal attack02_pressed
signal interact_pressed
signal sprint_changed(enabled: bool)

func poll() -> void:
	move_direction.x = Input.get_axis("py_move_left", "py_move_right")
	move_direction.y = Input.get_axis("py_move_up", "py_move_down")
	
	if Input.is_action_just_pressed("py_menu"):
		menu_pressed.emit()
	
	if Input.is_action_just_pressed("py_sprint"):
		sprint_changed.emit(true)
	elif Input.is_action_just_released("py_sprint"):
		sprint_changed.emit(false)
	
	if Input.is_action_just_pressed("py_jump"):
		jump_pressed.emit()
	
	if Input.is_action_just_pressed("py_interact"):
		interact_pressed.emit()
	
	if Input.is_action_just_pressed("py_attack_01"):
		attack01_pressed.emit()
	
	if Input.is_action_just_pressed("py_attack_02"):
		attack02_pressed.emit()

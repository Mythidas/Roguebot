extends Node2D
class_name PlayerBody

@onready var right_arm: Node2D = $RightArm
@onready var left_arm: Node2D = $LeftArm
@onready var legs: Node2D = $Legs

func update_right_arm(item: ArmItem) -> void:
	right_arm.get_children().clear()
	if item != null && item.arm_scene != null:
		var right_arm_scene := item.arm_scene.instantiate()
		right_arm.add_child(right_arm_scene)

func update_left_arm(item: ArmItem) -> void:
	left_arm.get_children().clear()
	if item != null && item.arm_scene != null:
		var left_arm_scene := item.arm_scene.instantiate()
		left_arm.add_child(left_arm_scene)

func update_legs(item: LegItem) -> void:
	legs.get_children().clear()
	if item != null && item.leg_scene != null:
		var leg_scene := item.leg_scene.instantiate()
		legs.add_child(leg_scene)

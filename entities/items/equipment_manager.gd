extends Node
class_name EquipmentManager

@export var right_arm: ArmItem
@export var left_arm: ArmItem
@export var legs: LegItem

signal right_arm_changed(item: ArmItem)
signal left_arm_changed(item: ArmItem)
signal legs_changed(item: LegItem)

func equip_item(item: Item, slot: int = -1) -> void:
	var arm_item := item as ArmItem
	var leg_item := item as LegItem
	
	if arm_item != null:
		if slot == -1:
			if right_arm == null:
				right_arm = arm_item
				right_arm_changed.emit(arm_item)
			else:
				_drop_item(left_arm)
				left_arm = arm_item
				left_arm_changed.emit(arm_item)
		elif slot == 0:
			_drop_item(right_arm)
			right_arm = arm_item
			right_arm_changed.emit(arm_item)
		elif slot == 1:
			_drop_item(left_arm)
			left_arm = arm_item
			left_arm_changed.emit(arm_item)
	elif leg_item != null:
		_drop_item(legs)
		legs = leg_item
		legs_changed.emit(leg_item)

func _drop_item(_item: Item) -> void:
	pass

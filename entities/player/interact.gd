extends Area2D
class_name PlayerInteract

var _interactables: Array[Interactable] = []
var _nearest: Interactable = null

func _init() -> void:
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)

func _process(_delta: float) -> void:
	var closest: float = INF
	var interactable: Interactable = null
	for i in _interactables:
		if position.distance_to(i.position) < closest:
			closest = position.distance_to(i.position)
			interactable = i
	
	if interactable == null:
		if _nearest != null: _nearest.defocused.emit()
		_nearest = null
	elif interactable != _nearest:
		if _nearest != null: _nearest.defocused.emit()
		_nearest = interactable
		interactable.focused.emit()

func interact(player: int) -> void:
	if _nearest: _nearest.interact.emit(player)

func _on_area_entered(area: Area2D) -> void:
	if area is Interactable:
		_interactables.append(area)

func _on_area_exited(area: Area2D) -> void:
	if area is Interactable:
		_interactables.erase(area)

extends CharacterBody2D
class_name ItemPickup

@export var item: Item

@onready var sprite: Sprite2D = $Interactable/Sprite2D
@onready var interactable: Interactable = $Interactable

var _float_time: float = 0.0

func _ready() -> void:
	if !item: return
	
	sprite.texture = item.icon
	
	interactable.interact.connect(_on_interact)
	interactable.focused.connect(_on_focus)
	interactable.defocused.connect(_on_defocus)

func _physics_process(delta: float) -> void:
	if is_on_floor():
		_float_time += delta
		sprite.position.y = sin(_float_time * 2.0) * 3.0
	else:
		velocity.y += (get_gravity().y / 2.0) * delta
		move_and_slide()

func _on_interact(player: int) -> void:
	var controller = GameState.get_player(player)
	controller.equipment.equip_item(item)
	queue_free()

func _on_focus() -> void:
	sprite.material.set_shader_parameter("outline_enabled", true)

func _on_defocus() -> void:
	sprite.material.set_shader_parameter("outline_enabled", false)

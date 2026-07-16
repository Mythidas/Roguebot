extends CharacterBody2D
class_name PlayerController

@onready var input: PlayerInput = $Input
@onready var conditions: PlayerConditions = $Conditions
@onready var interact: PlayerInteract = $Interact
@onready var body: PlayerBody = $Body
@onready var equipment: EquipmentManager = $EquipmentManager

var id: int = 0
var machine: StateMachine

func _make_state(state: PlayerState) -> PlayerState:
	state.player = self
	return state

func _ready() -> void:
	GameState.add_player(self)
	
	machine = StateMachine.new()
	machine.add_state("idle", _make_state(PlayerIdleState.new()))
	machine.add_state("walk", _make_state(PlayerWalkState.new()))
	machine.change_to("idle")
	
	input.jump_pressed.connect(_on_jump)
	input.interact_pressed.connect(_on_interact)
	
	equipment.right_arm_changed.connect(body.update_right_arm)
	equipment.left_arm_changed.connect(body.update_left_arm)
	equipment.legs_changed.connect(body.update_legs)

func _process(delta: float) -> void:
	input.poll()
	machine.update(delta)

func _physics_process(delta: float) -> void:
	machine.physics_update(delta)

func apply_movement(speed: Vector2, delta: float) -> void:
	velocity.x = move_toward(velocity.x, speed.x, 2000.0 * delta)
	velocity.y = move_toward(velocity.y, speed.y, 2000.0 * delta)
	move_and_slide()

func _on_jump() -> void:
	if is_on_floor() and conditions.can(PlayerConditions.Action.JUMP):
		machine.change_to("jump")

func _on_interact() -> void:
	interact.interact(id)

extends DamageController

var _target_position: Vector2
const _SPEED: float = 800

@onready var this: Node2D = get_node(".") as Node2D

func on_damage(amount: float, emitter: DamageController):
	super.on_damage(amount, emitter)
	print("Combined Object - Damage Received: %f, Health Left: %f" % [amount, _health])

func apply_damage(receiver: DamageController):
	super.apply_damage(receiver)
	print("Combined Object - Damage Applied: %f" % [_damage])

func _death_sequence():
	print("Combined Should Be Dead")

func _ready():
	_target_position = this.position

func _input(event):
	if event is InputEventMouseButton:
		_target_position = (event as InputEventMouseButton).position

func _physics_process(delta: float):
	this.position = this.position.move_toward(_target_position, _SPEED * delta)

func _on_collide(area):
	if area is DamageController:
		apply_damage(area)

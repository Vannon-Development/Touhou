class_name DamageController extends Node2D

enum ControllerType { emitter, receiver, combined }

@export var _controller_type: ControllerType
@export var _damage: float
@export var _health: float

func on_damage(amount: float, emitter: DamageController):
	if _controller_type == ControllerType.emitter: return
	_health -= amount
	if _health <= 0:
		_death_sequence()

func apply_damage(receiver: DamageController):
	if _controller_type == ControllerType.receiver: return
	if receiver._controller_type == ControllerType.emitter: return
	receiver.on_damage(_damage, self)

func _death_sequence(): pass

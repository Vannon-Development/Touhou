class_name Player extends DamageController

@export var _speed: float

var _input: Vector2
@onready var _this: Area2D = $"."

func _process(_delta):
	_input = Input.get_vector("move_left", "move_right", "move_forward", "move_back")

func _physics_process(delta: float):
	_this.position += _input * _speed * delta

func death_sequence():
	print("Player is Dead!")
	_this.queue_free()


class_name PlayerShotPattern extends Resource

@export var shot_time: float

var _timer: float = 0
var _shot_parent: Node2D

func apply_time(delta: float, pos: Vector2):
	update_shots(delta)

	_timer += delta
	while _timer > shot_time:
		_timer -= shot_time
		fire_shots(_timer, pos)

func setup(parent: Node2D):
	_shot_parent = parent

func fire_shots(_init_time: float, _pos: Vector2): pass
func update_shots(_delta: float): pass

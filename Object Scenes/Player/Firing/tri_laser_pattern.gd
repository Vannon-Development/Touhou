class_name TriLaserPattern extends PlayerShotPattern

@export var _angle: float

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, 0)
	_setup_shot(init_time, pos, _angle)
	_setup_shot(init_time, pos, -_angle)

func _calc_pos(shot: PlayerShot):
	super._calc_pos(shot)
	var y: float = shot.current_time * _speed * -1
	var x: float = y * sin(shot.rotation) * -1
	shot.position = shot.init_position + Vector2(x, y)

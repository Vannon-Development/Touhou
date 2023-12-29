class_name WavePattern extends PlayerShotPattern

@export var _angle: float
@export var _full_width: float
@export var _frequency: float

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, _angle)

func _calc_pos(shot: PlayerShot):
	super._calc_pos(shot)
	var y := shot.current_time * _speed * -1
	var x := _full_width * shot.current_time * cos(fmod(shot.current_time, _frequency) / _frequency * 2 * PI)
	shot.position = shot.init_position + Vector2(x, y).rotated(shot.rotation)

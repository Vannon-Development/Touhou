class_name ShortSpreadPattern extends PlayerShotPattern

@export var _angle: float
@export var _min_scale: float

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, randf_range(-_angle, _angle))

func _calc_pos(shot: PlayerShot):
	super._calc_pos(shot)
	var dist: Vector2 = Vector2(0, shot.current_time * _speed * -1)
	shot.position = shot.init_position + dist.rotated(shot.rotation)

	var sc: float = clampf(lerpf(_min_scale, 1, shot.current_time / _total_ttl), _min_scale, 1)
	shot.scale = Vector2(sc, sc)

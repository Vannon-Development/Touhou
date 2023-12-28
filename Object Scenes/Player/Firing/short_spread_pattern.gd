class_name ShortSpreadPattern extends PlayerShotPattern

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, randf_range(-60, 60))

func _calc_pos(shot: PlayerShot):
	super._calc_pos(shot)
	var y: float = shot.current_time * _speed * -1
	var x: float = y * sin(shot.rotation) * -1
	shot.position = shot.init_position + Vector2(x, y)

	var sc: float = clampf(lerpf(0.6, 1, shot.current_time / _total_ttl), 0.6, 1)
	shot.scale = Vector2(sc, sc)

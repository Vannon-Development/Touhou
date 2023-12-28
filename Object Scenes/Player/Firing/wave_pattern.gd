class_name WavePattern extends PlayerShotPattern

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, 20)

func _calc_pos(shot: PlayerShot):
	super._calc_pos(shot)
	var y := shot.current_time * _speed * -1
	var x := 80 * shot.current_time * cos(shot.current_time / 0.08)
	shot.position = shot.init_position + Vector2(x, y).rotated(shot.rotation)

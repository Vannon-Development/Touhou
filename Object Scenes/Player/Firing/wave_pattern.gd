class_name WavePattern extends PlayerShotPattern

@export var _shot_node: PackedScene
@export var _speed: float
@export var _range: float

var _shot_queue: NodeQueue
var _current_shots: Array[PlayerShot]
var _total_ttl: float

func setup(parent: Node2D):
	super.setup(parent)
	_shot_queue = NodeQueue.new()
	_shot_queue.root_scene = _shot_node
	_current_shots = []
	_total_ttl = _range / _speed

func fire_shots(init_time: float, pos: Vector2):
	super.fire_shots(init_time, pos)
	_setup_shot(init_time, pos, 20)

func _setup_shot(init_time: float, pos: Vector2, angle: float):
	var shot := _shot_queue.create() as PlayerShot
	shot.init_position = pos
	shot.rotation_degrees = angle
	shot.current_time = init_time
	shot.visible = false
	_shot_parent.add_child(shot)
	_register_shot(shot)

func update_shots(delta: float):
	for shot in _current_shots:
		shot.visible = true
		shot.current_time += delta
		_calc_pos(shot)
		if shot.current_time > _total_ttl:
			_remove_shot(shot)
	for index in range(_current_shots.size() - 1, 0, -1):
		if _current_shots[index].get_parent() == null:
			_current_shots.remove_at(index)
			index -= 1

func _register_shot(shot: PlayerShot):
	for item in _current_shots:
		if item == shot: return
	_current_shots.append(shot)

func _remove_shot(shot: PlayerShot):
	if shot.get_parent() == null: return
	_shot_parent.remove_child(shot)
	_shot_queue.finish(shot)

func _calc_pos(shot: PlayerShot):
	var y := shot.current_time * _speed * -1
	var x := 80 * shot.current_time * cos(shot.current_time / 0.08)
	shot.position = shot.init_position + Vector2(x, y).rotated(shot.rotation)

class_name PlayerShotPattern extends Resource

@export var shot_time: float
@export var _shot_node: PackedScene
@export var _speed: float
@export var _range: float

var _timer: float = 0
var _shot_parent: Node2D
var _shot_queue: NodeQueue
var _current_shots: Array[PlayerShot]
var _total_ttl: float

func apply_time(delta: float, pos: Vector2):
	update_shots(delta)

	_timer += delta
	while _timer > shot_time:
		_timer -= shot_time
		fire_shots(_timer, pos)

func setup(parent: Node2D):
	_shot_parent = parent
	_shot_queue = NodeQueue.new()
	_shot_queue.root_scene = _shot_node
	_current_shots = []
	_total_ttl = _range / _speed

func fire_shots(_init_time: float, _pos: Vector2): pass
func _calc_pos(_shot: PlayerShot): pass

func _remove_shot(shot: PlayerShot):
	if shot.get_parent() == null: return
	_shot_parent.remove_child(shot)
	_shot_queue.finish(shot)
	shot.shot_hit.disconnect(_shot_collided)

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

func _setup_shot(init_time: float, pos: Vector2, angle: float):
	var shot := _shot_queue.create() as PlayerShot
	shot.init_position = pos
	shot.rotation_degrees = angle
	shot.current_time = init_time
	shot.visible = false
	_shot_parent.add_child(shot)
	_register_shot(shot)
	shot.shot_hit.connect(_shot_collided)

func _register_shot(shot: PlayerShot):
	for item in _current_shots:
		if item == shot: return
	_current_shots.append(shot)

func _shot_collided(shot: PlayerShot):
	_remove_shot.call_deferred(shot)

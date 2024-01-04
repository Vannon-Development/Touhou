extends Node2D

const _spawn_time: float = 2.5

var _timer: float

func _ready():
	randomize()
	_timer = 0

func _process(delta: float):
	_timer += delta
	if _timer >= _spawn_time: _spawn_enemy()

func _spawn_enemy():
	_timer = 0
	var enemy := VerticalEnemy.spawn(Vector2(randf_range(1920 / 3.0, 1920 * 2 / 3.0), -30))
	add_child(enemy)

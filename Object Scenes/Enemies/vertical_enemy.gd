class_name VerticalEnemy extends EnemyBase

@export var _speed: float

static var _spawn_object: PackedScene = load("res://Object Scenes/Enemies/vertical_enemy.tscn")

func _physics_process(delta: float):
	position += Vector2(0, _speed * delta)

func _left_screen():
	queue_free()

func _death_sequence():
	queue_free()

static func spawn(pos: Vector2) -> EnemyBase:
	var obj := _spawn_object.instantiate() as EnemyBase
	obj.position = pos
	return obj

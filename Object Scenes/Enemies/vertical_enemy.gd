extends EnemyBase

@export var _speed: float

func _physics_process(delta):
	position += Vector2(0, _speed * delta)

func _left_screen():
	queue_free()

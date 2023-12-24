extends Node2D

@onready var _slider: VSlider = $"VSlider"

var _queue: NodeQueue
var _timer: float

func _ready():
	_queue = NodeQueue.new()
	_queue.root_scene = load("res://Examples/Object Queue/repeatable_object.tscn")

func _process(delta: float):
	_timer -= delta
	if _timer <= 0:
		_start_ball()
		_timer += 1.0 / _slider.value

func _start_ball():
	var ball = _queue.create() as Node2D
	ball.position = Vector2(1920 / 2.0, -100)
	ball.screen_exited.connect(_on_exit)
	add_child(ball)

func _on_exit(obj: Node2D):
	remove_child(obj)
	obj.screen_exited.disconnect(_on_exit)
	_queue.finish(obj)

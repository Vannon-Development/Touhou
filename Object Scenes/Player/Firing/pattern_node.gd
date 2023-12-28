class_name PatternNode extends Node2D

@export var _patterns: Array[PlayerShotPattern]

var _shot_parent: Node2D

func _ready():
	_shot_parent = Node2D.new()
	get_tree().root.add_child.call_deferred(_shot_parent)
	for item in _patterns:
		item.setup(_shot_parent)

func _physics_process(delta: float):
	for item in _patterns:
		item.apply_time(delta, global_position)

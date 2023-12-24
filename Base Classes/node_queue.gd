class_name NodeQueue extends RefCounted

var root_scene: PackedScene

var _queue: Array[Node] = []

func create() -> Node:
	if _queue.size() == 0:
		return root_scene.instantiate()
	return _queue.pop_front()

func finish(obj: Node):
	_queue.append(obj)

extends Node2D

var speed = 400

func _process(delta):
	position += transform.x * speed * delta

func _on_timer_timeout():
	queue_free()

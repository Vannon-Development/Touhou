extends Node2D

signal screen_exited(obj: Node2D)

func _ready():
	print("Ball Created")

func _process(delta: float):
	position.y += 500 * delta

func _on_screen_exit():
	screen_exited.emit(self)

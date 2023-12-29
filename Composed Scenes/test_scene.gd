extends Node2D

@onready var Enemy: Node2D = $Enemy

func _physics_process(delta):
	Enemy.position += Vector2(200 * delta, 0)

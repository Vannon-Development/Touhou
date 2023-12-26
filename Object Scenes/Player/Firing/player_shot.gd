class_name PlayerShot extends DamageController

signal shot_hit()

var init_position: Vector2
var current_time: float

func apply_damage(receiver: DamageController):
	super.apply_damage(receiver)
	shot_hit.emit()
	queue_free()

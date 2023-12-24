extends DamageController

func apply_damage(receiver: DamageController):
	super.apply_damage(receiver)
	print("Emitter Object - Damage Applied: %f" % [_damage])

func _on_collide(area):
	if area is DamageController:
		apply_damage(area)

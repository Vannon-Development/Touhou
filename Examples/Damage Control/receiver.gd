extends DamageController

func on_damage(amount: float, emitter: DamageController):
	super.on_damage(amount, emitter)
	print("Receiver Object - Damage Received: %f, Health Left: %f" % [amount, _health])

func _death_sequence():
	super._death_sequence()
	print("Receiver Should Be Dead")

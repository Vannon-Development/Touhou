extends Node2D
class_name patterns

var bulletScene = preload("res://Object Scenes/Bullet/Bullet.tscn")

func Simple(spawners : float, timePerShoot : float, bulletsPerSpawner : float, radius : float, timer : Timer,rotater : Node2D, bulletSpeed : float, bulletRotationMultyplier : float):
	var step = 2 * PI / spawners
	
	for i in range(spawners):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotater.add_child(spawnPoint)
	
	timer.wait_time = timePerShoot
	timer.start()

func Double(spawners : float, timePerShoot : float, bulletsPerSpawner : float, radius : float, timer : Timer,rotater : Node2D, secondRotater : Node2D,bulletSpeed : float, bulletRotationMultyplier : float):
	var step = 2 * PI / spawners
	
	for i in range(spawners):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotater.add_child(spawnPoint)
	
	for i in range(spawners):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		secondRotater.add_child(spawnPoint)
	
	timer.wait_time = timePerShoot
	timer.start()

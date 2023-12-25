extends Node2D

var initialBulletSpeed = 400
const bulletScene = preload("res://Object Scenes/Bullet/Bullet.tscn")

@onready var shootTimer = $ShootTimer
@onready var rotater = $Rotater
@onready var flowerRotater = $RotaterFlower
const rotateSpeed = 0
const shootTime = 0.7
var bulletSpawnerCount = 20
const radius = 100

const flowerMode = false

const starMode = true
const starPoints = 5

func _ready():	
	var step = 2 * PI / bulletSpawnerCount
	
	for i in range(bulletSpawnerCount):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotater.add_child(spawnPoint)
	
	if flowerMode == true:
		for i in range(bulletSpawnerCount):
			var spawnPoint = Node2D.new()
			var pos = Vector2(radius, 0).rotated(step * i)
			spawnPoint.position = pos
			spawnPoint.rotation = pos.angle()
			flowerRotater.add_child(spawnPoint)
	
	shootTimer.wait_time = shootTime
	shootTimer.start()

func _process(delta):
	var newRotation = rotater.rotation_degrees + rotateSpeed * delta
	rotater.rotation_degrees = fmod(newRotation, 360)
	
	var flowerNewRotation = flowerRotater.rotation_degrees - rotateSpeed * delta
	flowerRotater.rotation_degrees = flowerNewRotation

func _on_shoot_timer_timeout():
	for children in rotater.get_children():
		var bullet = bulletScene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = children.global_position
		bullet.rotation = children.global_rotation
		if starMode == true && flowerMode == false:
			var bulletScript = children.get_child(children.get_instance_id().get_script())
			print(children.get_script())
		
	for children in flowerRotater.get_children():
		var bullet = bulletScene.instantiate()
		get_tree().root.add_child(bullet)
		bullet.position = children.global_position
		bullet.rotation = children.global_rotation

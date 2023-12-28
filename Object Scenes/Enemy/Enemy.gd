extends Node2D

var initialBulletSpeed = 400
const bulletScene = preload("res://Object Scenes/Bullet/Bullet.tscn")
const bulletGD = preload("res://Object Scenes/Bullet/Bullet.gd")

@onready var shootTimer = $ShootTimer
@onready var rotater = $Rotater
@onready var secondRotater = $secondRotater
@onready var bullet = $Bullet
@onready var patternsGen = patterns.new()

const rotateSpeed = 30
const shootTime = 0.5
const bulletSpawnerCount = 5
const bulletsPerSpawner = 3
const bulletsRotationMultyplier = 0.3
const bulletSpeed = 400
const radius = 100

var shootType = 1

func _ready():
	if shootType == 0 :
		patternsGen.Simple(bulletSpawnerCount, shootTime, bulletsPerSpawner, radius, shootTimer, rotater, bulletSpeed, bulletsRotationMultyplier)
	elif shootType == 1 :
		patternsGen.Double(bulletSpawnerCount, shootTime, bulletsPerSpawner, radius, shootTimer, rotater, secondRotater,bulletSpeed, bulletsRotationMultyplier)

func _process(delta):
	var newRotation = rotater.rotation_degrees + rotateSpeed * delta
	rotater.rotation_degrees = fmod(newRotation, 360)
	
	var newSecondRotation = secondRotater.rotation_degrees - 30 * delta
	secondRotater.rotation_degrees = fmod(newSecondRotation, 360)
	
	for children in rotater.get_children():
			for i in range(bulletsPerSpawner):
				var bullet = bulletScene.instantiate()
				get_tree().root.add_child(bullet)
				bullet.position = children.global_position
				bullet.rotation = children.global_rotation + i * bulletsRotationMultyplier
	
	if shootType == 1 :
		for children in secondRotater.get_children():
			for i in range(bulletsPerSpawner):
				var bullet = bulletScene.instantiate()
				get_tree().root.add_child(bullet)
				bullet.position = children.global_position
				bullet.rotation = children.global_rotation + i * bulletsRotationMultyplier

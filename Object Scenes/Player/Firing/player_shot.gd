class_name PlayerShot extends DamageController

signal shot_hit(shot: PlayerShot)

var init_position: Vector2
var current_time: float

@onready var _this: Area2D = $"."

func _ready():
	_this.area_entered.connect(_on_collision)

func apply_damage(receiver: DamageController):
	super.apply_damage(receiver)
	shot_hit.emit(self)

func _on_collision(area: Area2D):
	if (area as Node2D) is DamageController:
		apply_damage((area as Node2D) as DamageController)

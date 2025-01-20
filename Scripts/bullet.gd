extends CharacterBody2D

var pos : Vector2
var route : float
var direction : float
var SPEED : float = 2000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = pos
	global_rotation = route

func _physics_process(delta: float) -> void:
	velocity = Vector2(SPEED, 0).rotated(direction)
	move_and_slide()

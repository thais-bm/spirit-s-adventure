extends CharacterBody2D

var dir: float
var spawnPos : Vector2
var spawnRot : float

var vector_direction : Vector2
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot

func _physics_process(delta: float) -> void:
	if vector_direction == Vector2.LEFT:
		velocity = Vector2(-speed, 0)
	if vector_direction == Vector2.RIGHT:
		velocity = Vector2(speed, 0)
	move_and_slide()
	
	if is_on_ceiling() or is_on_floor() or is_on_wall():
		queue_free()

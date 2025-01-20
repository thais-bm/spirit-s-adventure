extends Node2D

# Constants and variables
var SPEED = 10
var speed_multiply = 20
var direction : Vector2 = Vector2.LEFT

# Signal
signal walked

# Child elements in use
@onready var parent = get_parent()

func _physics_process(_delta: float) -> void:
	# Change direction upon wall collision
	if parent.get_node("RayCastLeft").is_colliding():
		direction = Vector2.RIGHT
	if parent.get_node("RayCastRight").is_colliding():
		direction = Vector2.LEFT
	
	# Flip the player based on direction
	var center_position = get_parent().get_node("CenterPosition")
	if direction == Vector2.RIGHT:
		center_position.scale.x = -1
	elif direction == Vector2.LEFT:
		center_position.scale.x = 1
		
	# Moves the player
	parent.velocity = direction * SPEED * speed_multiply
	walked.emit()
	parent.move_and_slide()

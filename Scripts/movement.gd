extends Node

@export var speed = 10
@export var constant_speed = 2000

var old_direction = 1

signal moved

func move(direction: Vector2):
	if direction != Vector2.ZERO:
		moved.emit()
		
	get_parent().velocity = direction * speed * constant_speed
		
	get_parent().move_and_slide()

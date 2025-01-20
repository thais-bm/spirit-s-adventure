extends Node

@export var speed = 10
@export var constant_speed = 22

signal moved

func move(direction: Vector2):
	if direction != Vector2.ZERO:
		moved.emit()
	
	# Mudar de direção do "central_position: pai da hitbox e do sprite
	var center_position = get_parent().get_node("CenterPosition")
	if direction == Vector2.RIGHT:
		center_position.scale.x = 1
	elif direction == Vector2.LEFT:
		center_position.scale.x = -1

	# Mover
	get_parent().velocity = direction * speed * constant_speed
	get_parent().move_and_slide()
	
	

extends Node

@export var speed = 10
@export var constant_speed = 22

@export var bullet_scene : PackedScene = preload("res://Scenes/bullet.tscn")

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
	
func shoot(direction: Vector2):
	var bullet = bullet_scene.instantiate()
	bullet.dir = get_parent().get_node("CenterPosition/Gun").rotation
	bullet.spawnPos = get_parent().get_node("CenterPosition/Gun").global_position
	bullet.spawnRot = get_parent().get_node("CenterPosition/Gun").rotation
	
	bullet.vector_direction = direction
	
	get_parent().add_child(bullet)
	print("bou")
	
	

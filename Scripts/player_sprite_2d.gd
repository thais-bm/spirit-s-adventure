extends Sprite2D

var old_direction = 1

func on_movement_inputed(direction: Vector2):
	if direction.x > 0:
		flip_h = true
	elif direction.x < 0:
		flip_h = false

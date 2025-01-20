extends Node

signal movement_inputed(direction: Vector2)
signal attacked_hammer
signal stopped
signal fired

var last_direction : Vector2 = Vector2.ZERO
var is_stopped : bool = true
@export var input_lock : bool = false

func _process(delta: float) -> void:
	if not input_lock:
		var direction : Vector2 = Vector2.ZERO
		if Input.is_action_pressed("move_left"):
			direction = Vector2.LEFT
			last_direction = Vector2.LEFT
		if Input.is_action_pressed("move_right"):
			direction = Vector2.RIGHT
			last_direction = Vector2.RIGHT
		if Input.is_action_just_pressed("attack_marreta"):
			attacked_hammer.emit()
		if Input.is_action_just_pressed("throw_fireball"):
			if last_direction != Vector2.ZERO:
				fired.emit(last_direction)
		
		if direction != Vector2.ZERO:
			is_stopped = false
			movement_inputed.emit(direction)
		elif !is_stopped:
			is_stopped = true
			stopped.emit()

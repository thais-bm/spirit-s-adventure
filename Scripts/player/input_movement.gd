extends Node

signal movement_inputed(direction: Vector2)
signal attacked_hammer
signal stopped

@export var bullet_scene : PackedScene = preload("res://Scenes/bullet.tscn")

var is_stopped : bool = true
@export var input_lock : bool = false
var jump_speed : float = -30.0

func _process(delta: float) -> void:
	if not input_lock:
		var direction = Vector2.ZERO
		if Input.is_action_pressed("move_left"):
			direction = Vector2.LEFT
		if Input.is_action_pressed("move_right"):
			direction = Vector2.RIGHT
		if Input.is_action_just_pressed("attack_marreta"):
			print("atacou")
			attacked_hammer.emit()
		if Input.is_action_just_pressed("throw_fireball"):
			shoot()
			
		if direction != Vector2.ZERO:
			is_stopped = false
			movement_inputed.emit(direction)
		elif !is_stopped:
			is_stopped = true
			stopped.emit()

func shoot():
	print("bou")

extends Node

signal movement_inputed(direction: Vector2)
signal attacked_hammer

signal stopped
var is_stopped = true
@export var input_lock = false

# Controla os movimentos dos personagens
# Se apertar e segurar por x tempo personagem entra no modo corrida
func _process(delta: float) -> void:
	if not input_lock:
		var vel = Vector2.ZERO
		if Input.is_action_pressed("move_left"):
			vel.x -= delta
		if Input.is_action_pressed("move_right"):
			vel.x += delta
		if Input.is_action_pressed("jump"):
			print("jump")
			
		if vel != Vector2.ZERO:
			is_stopped = false
			movement_inputed.emit(vel)
		elif !is_stopped:
			is_stopped = true
			stopped.emit()

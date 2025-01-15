extends CharacterBody2D

var old_direction = 1

# Se eu adicionar isos aqui para mudar a escala e inverter o characterbody o boneco começa a teleportar P_P
#func _on_input_movement_inputed(direction: Vector2) -> void:
#	if sign(direction.x) != old_direction:
#		scale.x = -1
#		old_direction = sign(direction.x)

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("attack_marreta"):
		$AnimationPlayer.play("marreta")

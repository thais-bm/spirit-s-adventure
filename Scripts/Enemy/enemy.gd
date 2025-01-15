extends CharacterBody2D

var MAX_HEALTH : float = 50.0
var health : float

signal stopped


func _ready() -> void:
	health = MAX_HEALTH

func take_damage(attack: Attack):
	# Perder vida
	health -= attack.attack_damage
	$AnimationPlayer.play("hit")
	
	# Knockback
	velocity = (global_position - attack.attack_position) * attack.knockback_force
	move_and_slide()
	
	# Morte
	if health <= 0:
		$AnimationPlayer.play("death")
		queue_free()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play("idle")

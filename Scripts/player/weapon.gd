extends Node

# Mareta
# Dano: 10 de dano
# Força do knockback: 5
# Referencia da posição é o player

var attack_damage : float = 10.0
var knockback_force : float = 5.0
var player_position = self.position


func _on_attack_area_body_entered(body: Node2D) -> void:
	var attack : Attack = Attack.new()
	attack.attack_damage = attack_damage
	attack.knockback_force = knockback_force
	attack.attack_position = player_position
	
	# Procurando saber se ele pode tomar dano
	for child in body.get_children():
		if child.has_method("take_damage"):
			child.take_damage(attack)
			print("apanhou?")
			break

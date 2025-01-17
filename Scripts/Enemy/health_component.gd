extends Node

var MAX_HEALTH : float = 50.0
var health : float
@onready var parent = null

signal died
signal hurt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	health = MAX_HEALTH

# Take damage function
# Recebe: Objeto da classe Attack (possui atributos: dano, forca de KKk e posicao)
# O que faz: tira vida; empurra personagem; se zerar, mata ele
func take_damage(attack: Attack):
	# Perder vida
	health -= attack.attack_damage
	hurt.emit()
	
	# Knockback
	parent.velocity = (parent.global_position - attack.attack_position) * attack.knockback_force
	print((parent.global_position - attack.attack_position) * attack.knockback_force)
	parent.move_and_slide()
	
	# Morte
	if health <= 0:
		died.emit()
		parent.queue_free()
		

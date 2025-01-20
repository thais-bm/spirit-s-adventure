extends AnimationPlayer

var current_priority : int = 0

# Prioridades
# 3 -> Death
# 2 -> Hit
# 1 -> Walk

func play_animation(animation: String, priority: int):
	if priority >= current_priority:
		play(animation)
		current_priority = priority

func _on_animation_finished() -> void:
	current_priority = 0

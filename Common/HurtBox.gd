extends Area2D

export(bool) var show_hit = true

const HIT_EFFECT_SCENE = preload("res://Effects/HitEffect.tscn")


func _on_HurtBox_area_entered(area: Area2D) -> void:
	if show_hit:
		var hitEffect = HIT_EFFECT_SCENE.instance()
		var main = get_tree().current_scene
		main.add_child(hitEffect)
		hitEffect.global_position = global_position

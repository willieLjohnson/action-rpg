extends Node2D

const GRASS_EFFECT_SCENE = preload("res://Effects/GrassEffect.tscn")

func create_grass_effect() -> void:
	var grassEffect = GRASS_EFFECT_SCENE.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position



func _on_HurtBox_area_entered(_area: Area2D) -> void:
	create_grass_effect()
	queue_free()

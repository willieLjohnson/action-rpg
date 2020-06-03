extends Node2D


func create_grass_effect() -> void:
	var grassEffectScene = load("res://Effects/GrassEffect.tscn")
	var grassEffect = grassEffectScene.instance()
	var world = get_tree().current_scene
	world.add_child(grassEffect)
	grassEffect.global_position = global_position



func _on_HurtBox_area_entered(area: Area2D) -> void:
	create_grass_effect()
	queue_free()

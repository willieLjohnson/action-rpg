extends KinematicBody2D



func _on_HurtBox_area_entered(area: Area2D) -> void:
	queue_free()

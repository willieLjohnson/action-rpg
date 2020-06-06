extends Area2D


const HIT_EFFECT_SCENE = preload("res://Effects/HitEffect.tscn")

var invincible = false setget set_invicible

onready var timer = $Timer

signal invincibility_started
signal invincibility_ended

func set_invicible(value: bool) -> void:
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")

func start_invincibility(duration: float) -> void:
	self.invincible = true
	timer.start(duration)

func create_hit_effect() -> void:
	var hitEffect = HIT_EFFECT_SCENE.instance()
	var main = get_tree().current_scene
	main.add_child(hitEffect)
	hitEffect.global_position = global_position


func _on_Timer_timeout() -> void:
	self.invincible = false


func _on_HurtBox_invincibility_started() -> void:
	set_deferred("monitorable", false)
	

func _on_HurtBox_invincibility_ended() -> void:
	monitorable = true

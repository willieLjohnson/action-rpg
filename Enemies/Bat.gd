extends KinematicBody2D

const ENEMY_DEATH_EFFECT = preload("res://Effects/EnemyDeathEffect.tscn")

var knockback = Vector2.ZERO

onready var stats = $Stats

func _physics_process(delta: float) -> void:
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _on_HurtBox_area_entered(area: Area2D) -> void:
	stats.health -= area.damage
	knockback =  area.knockback_vector * 120


func _on_Stats_no_health() -> void:
	queue_free()
	var enemyDeathEffect = ENEMY_DEATH_EFFECT.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position

extends Camera2D

export(bool) var useLimits = true
onready var topLeft = $Limits/TopLeft
onready var bottomRight = $Limits/BottomRight

func _ready() -> void:
		if useLimits:
			limit_top = topLeft.position.y
			limit_left = topLeft.position.x
			limit_bottom = bottomRight.position.y
			limit_right = bottomRight.position.x

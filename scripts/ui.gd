extends CanvasLayer

@onready var overlay = $overlaycamera

var target_alpha = 0.0
var fade_speed = 2

func _process(delta):
	
	overlay.modulate.a = move_toward(
		overlay.modulate.a,
		target_alpha,
		fade_speed * delta
	)

func _ready() -> void:
	overlay.modulate.a = 0.0
	
func set_alert_strength(value):
	target_alpha = value * 0.6

extends Area2D

@onready var ui = get_tree().get_first_node_in_group("ui")

var player_inside = false
var resetting = false

var detection_time = 0.0
var max_detection_time = 2

func _process(delta):

	if resetting:
		return

	if player_inside:

		detection_time += delta

		ui.set_alert_strength(detection_time / max_detection_time)

		if detection_time >= max_detection_time:

			resetting = true

			await Transition.change_scene("res://levels/fase2.tscn")

	else:

		detection_time = 0.0

		ui.set_alert_strength(0)

func _on_body_entered(body):

	if body.is_in_group("player"):

		player_inside = true

func _on_body_exited(body):

	if body.is_in_group("player"):

		player_inside = false

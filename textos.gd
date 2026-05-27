extends Area2D

@export_multiline var text := ""

@onready var dialog_ui = get_tree().get_first_node_in_group("dialog_ui")
@onready var sprite = $AnimatedSprite2D if has_node("AnimatedSprite2D") else $Sprite2D
var player_inside := false
var opened := false


func interact():
	if not player_inside:
		return

	if opened:
		close_dialog()
	else:
		open_dialog()


func open_dialog():
	dialog_ui.show_text(text)
	opened = true


func close_dialog():
	dialog_ui.hide_text()
	opened = false


func _on_body_entered(body):
	if body.is_in_group("player"):
		highlight()
		player_inside = true
	

func _on_body_exited(body):
	if body.is_in_group("player"):
		unhighlight()
		player_inside = false

		if opened:
			close_dialog()


func highlight():

	sprite.modulate = Color(1.5, 1.5, 1.5)

func unhighlight():

	sprite.modulate = Color(1, 1, 1)

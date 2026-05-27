extends Area2D

var used = false

func interact():
	if used:
		return

	used = true

	var player = get_tree().get_first_node_in_group("player")
	player.pode_se_mover = false

	await Transition.change_scene("res://levels/fase2.tscn")

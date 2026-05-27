extends Area2D

@onready var cano_1: Area2D = $"../Cano1"


func interact():

	var player = get_tree().get_first_node_in_group("player")
	
	player.teleport_to(cano_1.global_position)

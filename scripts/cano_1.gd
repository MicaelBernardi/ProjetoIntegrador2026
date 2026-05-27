extends Area2D

@onready var cano_2: Area2D = $"../Cano2"


func interact():

	var player = get_tree().get_first_node_in_group("player")
	
	player.teleport_to(cano_2.global_position)

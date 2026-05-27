extends Node2D


func _ready() -> void:
	await get_tree().process_frame
	$Camera2D.make_current()


func _process(delta: float) -> void:
	pass

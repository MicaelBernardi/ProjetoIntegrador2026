extends Node2D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	$Camera2D.make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

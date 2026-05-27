extends CanvasLayer

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var color: ColorRect = $ColorRect

func fade_in():
	anim.play("fade_in")
	await anim.animation_finished

func fade_out():
	anim.play("fade_out")
	await anim.animation_finished

func change_scene(path: String):
	await fade_out()
	get_tree().change_scene_to_file(path)
	await get_tree().process_frame
	await fade_in()

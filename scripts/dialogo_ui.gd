extends CanvasLayer

@onready var panel = $Panel
@onready var text_label = $Panel/RichTextLabel

func _ready():

	hide_text()

func show_text(text):
	visible = true

	panel.visible = true

	text_label.visible = true

	text_label.text = text

func hide_text():

	visible = false

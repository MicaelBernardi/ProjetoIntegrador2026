extends CharacterBody2D

const SPEED = 120.0
const JUMP_VELOCITY = -250.0

var pode_se_mover = true
var interactable = null

@onready var _animated_sprite = $AnimatedSprite2D2
@onready var interaction_area = $interacao
@onready var interaction_icon = $icone_interacao

func _ready():
	$Camera2D.make_current()
	interaction_area.area_entered.connect(_on_area_entered)
	interaction_area.area_exited.connect(_on_area_exited)

func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
		#_animated_sprite.play("jump")

	if not pode_se_mover:

		velocity.x = 0

		if is_on_floor():
			_animated_sprite.play("idle")

		move_and_slide()
		return

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction:

		velocity.x = direction * SPEED

		_animated_sprite.flip_h = direction < 0

		#if is_on_floor():
			#_animated_sprite.play("run")

	else:

		velocity.x = move_toward(velocity.x, 0, SPEED)

		if is_on_floor():
			_animated_sprite.play("idle")

	if Input.is_action_just_pressed("interact"):

		if interactable:
			interactable.interact()

	move_and_slide()

func _on_area_entered(area):

	if area.has_method("interact"):
		interactable = area
		interaction_icon.visible = true
		
		if area.has_method("highlight"):
			area.highlight()

func _on_area_exited(area):

	if area == interactable:
		
		if area.has_method("unhighlight"):
			area.unhighlight()
		
		interactable = null
		interaction_icon.visible = false

func teleport_to(position: Vector2):
	global_position = position

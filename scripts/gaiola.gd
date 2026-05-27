extends StaticBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var player = $"../../Player"
var pode_interagir = false
var aberta = false

func _ready():
	_animated_sprite.animation_finished.connect(_on_animation_finished)

func _process(_delta):
	if pode_interagir and not aberta and Input.is_action_just_pressed("interact"):
		iniciar_abertura()

func iniciar_abertura():
	aberta = true
	if _animated_sprite.sprite_frames.has_animation("abrir"):
		_animated_sprite.play("abrir")
		player.pode_se_mover = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		pode_interagir = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		pode_interagir = false

func _on_animation_finished():
	if _animated_sprite.animation == "abrir":
		finalizar_abertura()

func finalizar_abertura():
	player.pode_se_mover = true
	$CollisionShape2D.set_deferred("disabled", true)
	$CollisionShape2D4.set_deferred("disabled", true)
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		player.z_index = 2

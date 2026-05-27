extends Area2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"

var pode_interagir = false
var aberta = false

func _ready():
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _process(_delta):
	if pode_interagir and not aberta and Input.is_action_just_pressed("interact"):
		iniciar_abertura()

func iniciar_abertura():
	aberta = true
	if animated_sprite.sprite_frames.has_animation("abrir"):
		animated_sprite.play("abrir")
		player.pode_se_mover = false

func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		pode_interagir = true
		if !aberta:
			highlight()

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		pode_interagir = false
		unhighlight()

func _on_animation_finished():
	if animated_sprite.animation == "abrir":
		finalizar_abertura()

func finalizar_abertura():
	player.pode_se_mover = true
	$"../Camera/AreaCamera/CollisionShape2D".set_deferred("disabled", true)
	
	
func highlight():
	animated_sprite.modulate = Color(1.5, 1.5, 1.5)

func unhighlight():
	animated_sprite.modulate = Color(1, 1, 1)

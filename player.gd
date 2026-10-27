extends CharacterBody2D

const SPEED = 80.0

# Aponta para o nome exato do seu nó no painel de Cena
@onready var animacao = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	# Lendo entrada do usuário
	if Input.is_action_pressed('ui_left'):
		velocity.x = -1 * SPEED
		animacao.play("walk_left")
	if Input.is_action_pressed('ui_right'):
		velocity.x = 1 * SPEED
		animacao.play("walk_right")
	if Input.is_action_pressed('ui_up'):
		velocity.y = -1 * SPEED
		animacao.play("walk_up")
	if Input.is_action_pressed('ui_down'):
		velocity.y = 1 * SPEED
		animacao.play("walk_down")

	move_and_slide()

	# Bateu em alguma coisa? Recomeça a fase.
	if get_slide_collision_count() > 0:
		get_tree().reload_current_scene()

	# Controle de animação
	if velocity == Vector2.ZERO: 
		animacao.play("idle")

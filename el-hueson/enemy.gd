extends CharacterBody2D

var speed = 20

var player_chase = false
var player = null

@onready var animated_sprite = $AnimatedSprite2D  # Nodo AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if player_chase and player:
		# Movimiento horizontal hacia el jugador
		var direction = sign(player.position.x - position.x)
		velocity.x = direction * speed

		# Voltear sprite según dirección
		animated_sprite.flip_h = direction < 0

		# Cambiar a animación de "run" si no está activa
		if animated_sprite.animation != "run":
			animated_sprite.play("run")
	else:
		velocity.x = 0

		# Cambiar a animación de "idle" si no está activa
		if animated_sprite.animation != "idle":
			animated_sprite.play("iddle")
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Verifica que sea el jugador
		player = body
		player_chase = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":  # Deja de perseguir solo si el jugador sale del área
		player = null
		player_chase = false

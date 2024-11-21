#extends CharacterBody2D


#const SPEED = 130.0
#const JUMP_VELOCITY = -320.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


#func _physics_process(delta):
	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta

	# Handle jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

#	move_and_slide()

# ===========================================================================================================.

extends CharacterBody2D

# Velocidades
@export var speed = 130
@export var jump_force = -300

# Gravedad personalizada
@export var gravity = 800

# Referencia al AnimatedSprite2D
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction = 0

	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Leer entrada del jugador para moverse horizontalmente
	if Input.is_action_pressed("ui_left"):
		direction = -1
	elif Input.is_action_pressed("ui_right"):
		direction = 1

	# Actualizar velocidad horizontal
	velocity.x = direction * speed

	# Saltar si está en el suelo y se presiona el botón de salto
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_force

	# Mover al personaje
	move_and_slide()

	# Cambiar animaciones
	if not is_on_floor():
		sprite.play("jump")  # Cambiar a la animación de salto si estás en el aire
	elif direction != 0:
		sprite.play("walk")  # Cambiar a la animación de caminar si te mueves
		sprite.flip_h = direction < 0  # Voltear sprite si vas a la izquierda
	else:
		sprite.play("idle")  # Cambiar a la animación de estar quieto










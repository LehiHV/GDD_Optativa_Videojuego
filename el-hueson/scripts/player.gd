extends CharacterBody2D

const MAX_HEALTH = 3

@export var speed = 130
@export var jump_force = -300
@export var gravity = 800
@export var health = MAX_HEALTH

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_bar = $"HealthBar"

var audio_player: AudioStreamPlayer
var death_sound: AudioStreamPlayer
var jump_sound: AudioStreamPlayer
var is_dead = false
var death_animation_started = false


func _ready() -> void:
	audio_player = AudioStreamPlayer.new()
	var stream = load("res://assets/RPG-Game-Music-Asset-Pack.ogg")
	audio_player.stream = stream
	add_child(audio_player)
	audio_player.volume_db = 0
	audio_player.autoplay = true
	audio_player.play()
	
	death_sound = AudioStreamPlayer.new()
	var death_stream = load("res://assets/Game-Over-sound-effect.ogg")
	death_sound.stream = death_stream
	add_child(death_sound)
	death_sound.volume_db = 0
	
	jump_sound = AudioStreamPlayer.new()
	var jump_stream = load("res://assets/Effecto-de-sonido-de-salto-retro-para-juegos-de-8Bits-_1.ogg")
	jump_sound.stream = jump_stream
	add_child(jump_sound)
	jump_sound.volume_db = 0
	
	health_bar.set_health(health)

func _physics_process(delta: float) -> void:
	if is_dead:
		if not death_animation_started:
			sprite.play("death")
			death_animation_started = true
		return
	else:
		var direction = 0
		
		if not is_on_floor():
			velocity.y += gravity * delta
			if position.y > 600:
				die()
		
		if Input.is_action_pressed("ui_left"):
			direction = -1
		elif Input.is_action_pressed("ui_right"):
			direction = 1
		
		velocity.x = direction * speed
		
		if Input.is_action_just_pressed("ui_up") and is_on_floor():
			velocity.y = jump_force
			damage(1)
			jump_sound.play()
		
		move_and_slide()
		
		if not is_on_floor():
			sprite.play("jump")
		elif direction != 0:
			sprite.play("walk")
			sprite.flip_h = direction < 0
		else:
			sprite.play("idle")

func damage(value: int) -> void:
	health -= value
	health_bar.set_health(health)
	if health < 0:
		die()
		

func die() -> void:
	is_dead = true
	audio_player.stop()
	death_sound.play()
	sprite.play("death")
	velocity = Vector2.ZERO

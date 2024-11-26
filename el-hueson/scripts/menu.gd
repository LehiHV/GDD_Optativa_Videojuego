extends Control

# Referencia al AudioStreamPlayer
@onready var audio_player = $AudioStreamPlayer

func _ready() -> void:
	# Reproducir el sonido automáticamente al iniciar
	if audio_player:
		audio_player.play()

func _on_button_pressed() -> void:
	# Cambiar a la escena 'game' y expandir la ventana
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_button_2_pressed() -> void:
	# Salir del juego
	get_tree().quit()

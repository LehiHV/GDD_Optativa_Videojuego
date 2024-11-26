extends Node2D

func _ready() -> void:
	# Configura el tamaño de la ventana al cargar la escena
	DisplayServer.window_set_size(Vector2(1280, 720)) # Reemplaza con las dimensiones deseadas

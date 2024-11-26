extends Control

func _ready():
	# Conectar las señales de los botones al nodo Control correctamente con Callable
	$Button.connect("pressed", Callable(self, "_on_Button_pressed"))
	$Button2.connect("pressed", Callable(self, "_on_Button2_pressed"))

# Función para manejar el evento del primer botón
func _on_Button_pressed():
	# Cambiar a la escena inicial
	get_tree().change_scene_to_file("res://scenes/game.tscn")

# Función para manejar el evento del segundo botón
func _on_Button2_pressed():
	# Salir del juego
	get_tree().quit()

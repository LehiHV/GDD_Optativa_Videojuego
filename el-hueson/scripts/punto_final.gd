extends Area2D

# Usamos la función generada automáticamente por Godot
func _on_body_entered(body):
	if body.name == "Player":
		print("¡Jugador ha entrado en el área!")
		get_tree().change_scene_to_file("res://scenes/vista_final.tscn")

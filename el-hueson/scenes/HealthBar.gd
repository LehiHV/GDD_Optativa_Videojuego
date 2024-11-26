extends Control

var HealthLabel: Label
var HealthBar: ProgressBar

func _ready():
	HealthLabel = get_node("HealthLabel")
	HealthBar = get_node("HealthProgressBar")
	pass # Replace with function body.

func _process(delta):
	pass
	
func set_health(value: int):
	HealthLabel.text = "Health: %s" % value
	HealthBar.value = value

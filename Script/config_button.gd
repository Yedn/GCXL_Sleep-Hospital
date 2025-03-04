extends TextureButton
class_name ConfigButton

@onready var config: Control = $"../Config"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	config.visible = !config.visible
	config.update()
	$"../Menu".visible = false

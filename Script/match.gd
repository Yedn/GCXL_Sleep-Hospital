extends Control
class_name Match

var open:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_2_pressed() -> void:
	open = !open
	if open == true:
		$"../Next2/TileMapLayer2".visible = true
		$"../Next2/TileMapLayer".visible = false
		visible = true
	else:
		$"../Next2/TileMapLayer2".visible = false
		$"../Next2/TileMapLayer".visible = true
		visible = false


func _on_button_pressed() -> void:
	visible = false
	get_parent().visible = true

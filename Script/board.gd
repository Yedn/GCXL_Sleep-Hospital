extends Control
class_name Board

var open:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var startpos:float = -32
var endpos:float = 420

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if open == true:
		position.y = lerpf(position.y,startpos,10*delta)
	else:
		position.y = lerpf(position.y,endpos,10*delta)

func _on_next_2_pressed() -> void:
	open = !open
	if open == true:
		$"../Next2/TileMapLayer2".visible = true
		$"../Next2/TileMapLayer".visible = false
		#visible = true
	else:
		$"../Next2/TileMapLayer2".visible = false
		$"../Next2/TileMapLayer".visible = true
		#visible = false


func _on_button_pressed() -> void:
	$Test.visible = true
	#$Button.visible = false

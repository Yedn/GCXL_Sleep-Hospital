extends TextureButton

var play:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	play = !play
	$"../AudioStreamPlayer".stream_paused = !play
	match play:
		true:texture_normal = load("res://speaker.png")
		false:texture_normal = load("res://speaker-off.png")

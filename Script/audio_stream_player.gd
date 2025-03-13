extends AudioStreamPlayer

@export var music_arr:Array[AudioStream]
# Called when the node enters the scene tree for the first time.
var id:int = 0

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	#play_next()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func play_next():
	stream = music_arr[id]
	play()
	if id <= music_arr.size()-2:
		id += 1
	else:
		id = 0

func _on_finished() -> void:
	play_next()

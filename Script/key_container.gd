extends Container
class_name KeyContainer

@export var key_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_key()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var i:int = 0
	for node in get_children():
		if node.dragged == false:
			node.position = node.position.lerp(Vector2(84*(i%6),44*(i/6)),25*delta)
		i += 1

func generate_key():
	for i in TextData.key_dic:
		var key:Key = key_scene.instantiate()
		key.text = i
		key.target_value_id = TextData.key_dic[i]
		add_child(key)

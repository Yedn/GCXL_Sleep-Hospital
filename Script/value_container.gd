extends Control
class_name ValueContainer

@export var value_dic:Dictionary ={
	"失眠症":1,
	"梦魇":1,
	"夜惊症":1,
	"遗尿症":1,
	"睡眠呼吸暂停综合征":1,
	"梦游症":1,
	"嗜睡症":1,
	"发作性睡病":1,
	"睡眠行为障碍":1,
	"磨牙症":1
}
@export var value_scene:PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_value()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var i:int = 0
	for node in get_children():
		node.position = node.position.lerp(Vector2(154*(i%4),79*(i/4)),25*delta)
		i += 1

func generate_value():
	var j:int = 0
	for i in value_dic:
		var value:Value = value_scene.instantiate()
		value.text = i
		value.id = j
		value.target_num = value_dic[i]
		add_child(value)
		j += 1

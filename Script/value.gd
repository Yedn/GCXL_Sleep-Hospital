extends Control
class_name Value

@onready var label: Label = $Label
@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var text:String = "口腔和牙齿疾病"
@export var id:int = 0
@export var has_num:int = 0
@export var target_num:int = 1

var state:int = 0
var finish:bool = false

func _ready() -> void:
	color_rect.material.set_shader_parameter("rate",size.x/size.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if has_num >= target_num and finish == false:
		finish = true
		TextData.unlock_dic[id] = true
	label.text = text+"\n(%d/%d)"%[has_num,target_num]
	if finish == false:
		match state:
			0:color_rect.material.set_shader_parameter("color",Color.AQUAMARINE)
			1:color_rect.material.set_shader_parameter("color",Color.GOLD)
	else:
		color_rect.material.set_shader_parameter("color",Color.AQUAMARINE)
		#color_rect.color = Color.AQUAMARINE

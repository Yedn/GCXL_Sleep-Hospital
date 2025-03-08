extends Control
class_name ButtonContainer

@onready var choosed_rect: ReferenceRect = $ChoosedRect
@onready var _1: Button = $"1"
@onready var _2: Button = $"2"
@onready var _3: Button = $"3"
@onready var _4: Button = $"4"
@onready var _5: Button = $"5"
@onready var _6: Button = $"6"
@onready var _7: Button = $"7"

var button_dic:Dictionary = {1:_1,2:_2,3:_3,4:_4,5:_5,6:_6,7:_7}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button_dic = {1:_1,2:_2,3:_3,4:_4,5:_5,6:_6,7:_7}


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		Data.choosed_id = get_room_under_mouse()
	if 1<=Data.choosed_id and Data.choosed_id<=7:
		choosed_rect.visible = true
		choosed_rect.global_position = button_dic[Data.choosed_id].global_position
	else:
		choosed_rect.visible = false


func get_room_under_mouse() -> int:
	var mouse_position = get_global_mouse_position()
	for id in 7:
		var button:Button = get_node(str(id+1))
		var button_rect = Rect2(button.global_position,button.size)
		if button_rect.has_point(mouse_position):
			return id+1
		elif mouse_position.x <= -39 or (mouse_position.y>=350 or mouse_position.y<=-25):
			return Data.choosed_id
	return 0


func _on_1_pressed() -> void:
	Data.choosed_id = 1


func _on_2_pressed() -> void:
	Data.choosed_id = 2


func _on_3_pressed() -> void:
	Data.choosed_id = 3


func _on_4_pressed() -> void:
	Data.choosed_id = 4


func _on_5_pressed() -> void:
	Data.choosed_id = 5


func _on_6_pressed() -> void:
	Data.choosed_id = 6


func _on_7_pressed() -> void:
	Data.choosed_id = 7

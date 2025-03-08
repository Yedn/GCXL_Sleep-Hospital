extends Control
class_name Key

@onready var value_container: ValueContainer = $"../../../ValueScrollContainer/ValueContainer"
@onready var label: Label = $Label

@export var target_value_id:int = 0
@export var text:String
var dragged:bool = false
#var ori_position:Vector2

signal drag_start
signal drag_end

func _ready() -> void:
	pass
	#ori_position = global_position

var ori_value:Value
func _process(delta: float) -> void:
	label.text = text
	if dragged == true:
		global_position = global_position.lerp(get_global_mouse_position()-size/2,25*delta)
		var value:Value = get_value()
		if ori_value != null:
			ori_value.state = 0
		if value != null:
			value.state = 1
			ori_value = value
	else:
		pass
		#global_position = global_position.lerp(ori_position,25*delta)


func _on_button_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed():
				drag_start.emit()
			else:
				drag_end.emit()

func get_value() -> Node:
	for node in value_container.get_children():
		var rect:Rect2 = Rect2(node.global_position,node.size)
		if rect.has_point(get_global_mouse_position()):
			return node
	return null

func _on_drag_start():
	dragged = true

func _on_drag_end():
	dragged = false
	var value:Value = get_value()
	if value != null:
		if value.finish == false:
			Data.suanli -= 1
			if target_value_id == value.id:
				value.has_num += 1
				queue_free()
				value.animation_player.play("right_animation")
			else:
				value.animation_player.play("false_animation")
			if value.has_num >= value.target_num:
				value.animation_player.play("finish")
				value.get_parent().move_child(value,-1)
	if ori_value != null:
		ori_value.state = 0

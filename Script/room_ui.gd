extends Control
class_name RoomUI

@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var title: Control = $Title

@export var slot_scene:PackedScene
@export var room:Room

@onready var label: Label = $ScrollContainer/VBoxContainer/Label
@onready var label_2: Label = $ScrollContainer/VBoxContainer/Label2
@onready var label_3: Label = $ScrollContainer/VBoxContainer/Label3
@onready var shop:Shop = get_parent()
@onready var item_ui:ItemUI = shop.get_node("ItemUI")

var click:bool = false
func _ready() -> void:
	get_room()
	generate_slot()

func _process(delta: float) -> void:
	item_ui.item = get_slot_under_mouse()
	if room != get_room():
		room = get_room()
		generate_slot()
	if room == null:
		v_box_container.visible = false
		title.visible = false
	else:
		v_box_container.visible = true
		title.visible = true

func get_room() -> Room:
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null

func generate_slot():
	for node in v_box_container.get_children():
		if node.name.left(5) != "Label":
			node.queue_free()
	if room != null:
		for i in room.bed_num:
			var slot:RoomSlot = slot_scene.instantiate()
			slot.type = 0
			slot.id = i
			v_box_container.add_child(slot)
			v_box_container.move_child(label,0)
			v_box_container.move_child(label_2,-1)
		for i in room.facility_num:
			var slot:RoomSlot = slot_scene.instantiate()
			slot.type = 1
			slot.id = i
			v_box_container.add_child(slot)
			v_box_container.move_child(label_3,-1)
		for i in room.decoration_num:
			var slot:RoomSlot = slot_scene.instantiate()
			slot.type = 2
			slot.id = i
			v_box_container.add_child(slot)

func update():
	room = get_room()
	generate_slot()
	for node in v_box_container.get_children():
		if node.name.left(5) != "Label":
			node.update()

func get_slot_under_mouse() -> Item:
	var mouse_position = get_global_mouse_position()
	for node in v_box_container.get_children():
		var rect = Rect2(node.global_position,node.size)
		if rect.has_point(mouse_position) and node.name.left(5) != "Label":
			return node.item
	return null

extends Control
class_name ShopUI

@onready var title: Control = $Title
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var v_box_container1: VBoxContainer = $ScrollContainer2/VBoxContainer
@onready var v_box_container2: VBoxContainer = $ScrollContainer3/VBoxContainer
@onready var scroll_container: ScrollContainer = $ScrollContainer
@onready var scroll_container1: ScrollContainer = $ScrollContainer2
@onready var scroll_container2: ScrollContainer = $ScrollContainer3
@onready var label: Label = $Title/Label

@export var slot_scene:PackedScene
@export var room:Room

var focus_slot:ShopSlot

var startpos:float = 480
var endpos:float = 0

var display:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generate_slot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Data.choosed_id-1 >= 0:
		if Data.room_list[Data.choosed_id-1].choosed_slot == []:
			display = false
		else:
			display = true
	else:
		display = true
	#print(Data.room_list[Data.choosed_id].choosed_slot)
	if display == true:
		position = position.lerp(Vector2(192,endpos),15*delta)
	else:
		position = position.lerp(Vector2(192,startpos),15*delta)
	focus_slot = get_slot_under_mouse()
	if focus_slot != null:
		var item_value:Array = focus_slot.item.value
		label.text = "%s\n装饰：%d  舒适：%d\n解压：%d  医疗：%d\n管控：%d"%[focus_slot.item.item_name,item_value[0],item_value[1],item_value[2],item_value[3],item_value[4]]
	else:
		label.text = ""
	if room != get_room():
		room = get_room()
	if room != null:
		if room.choosed_slot != []:
			#title.visible = true
			match room.choosed_slot[0]:
				0:
					scroll_container.visible = true
					scroll_container1.visible = false
					scroll_container2.visible = false
				1:
					scroll_container1.visible = true
					scroll_container.visible = false
					scroll_container2.visible = false
				2:
					scroll_container2.visible = true
					scroll_container.visible = false
					scroll_container1.visible = false
		else:
			pass
			#scroll_container.visible = false
			#scroll_container1.visible = false
			#scroll_container2.visible = false
			#title.visible = false
	else:
		pass
		#scroll_container.visible = false
		#scroll_container1.visible = false
		#scroll_container2.visible = false
		#title.visible = false

func generate_slot():
	for node in v_box_container.get_children():
		node.queue_free()
	for node in v_box_container1.get_children():
		node.queue_free()
	for node in v_box_container2.get_children():
		node.queue_free()
	for i in Data.bed_num:
		var slot:ShopSlot = slot_scene.instantiate()
		slot.type = 0
		slot.id = i
		slot.name = str(Vector2(0,i))
		v_box_container.add_child(slot)
	for i in Data.facility_num:
		var slot:ShopSlot = slot_scene.instantiate()
		slot.type = 1
		slot.id = i
		slot.name = str(Vector2(1,i))
		v_box_container1.add_child(slot)
	for i in Data.decoration_num:
		var slot:ShopSlot = slot_scene.instantiate()
		slot.type = 2
		slot.id = i
		slot.name = str(Vector2(2,i))
		v_box_container2.add_child(slot)

func get_room() -> Room:
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null

func load_item(id:int,type:int) -> Item:
	var file_path
	if type == 0:
		file_path = "res://Item/bed/"
	elif type == 2:
		file_path = "res://Item/decoration/"
	elif type == 1:
		file_path = "res://Item/facility/"
	var path = file_path + str(id) + ".tres"
	var item:Item = load(path) as Item
	return item.new()

func update_all():
	for i in Data.bed_num:
		var slot:ShopSlot = v_box_container.get_node(str(Vector2(0,i)))
	for i in Data.facility_num:
		var slot:ShopSlot = v_box_container1.get_node(str(Vector2(1,i)))
	for i in Data.decoration_num:
		var slot:ShopSlot = v_box_container2.get_node(str(Vector2(2,i)))

func update():
	room = get_room()
	#generate_slot()
	update_all()

func get_slot_under_mouse() -> ShopSlot:
	var mouse_position = get_global_mouse_position()
	for node in v_box_container.get_children():
		var rect = Rect2(node.global_position,node.size)
		if rect.has_point(mouse_position) and scroll_container.visible == true:
			return node
	for node in v_box_container1.get_children():
		var rect = Rect2(node.global_position,node.size)
		if rect.has_point(mouse_position) and scroll_container1.visible == true:
			return node
	for node in v_box_container2.get_children():
		var rect = Rect2(node.global_position,node.size)
		if rect.has_point(mouse_position) and scroll_container2.visible == true:
			return node
	return null

extends Control
class_name RoomSlot

@onready var back_tile: TileMapLayer = $Back
@onready var name_label: Label = $Name
@onready var level_label: Label = $Level
@onready var button: Button = $Button
@onready var item_tile: TileMapLayer = $Item
@onready var main:Main = get_node("/root/Main")

@export var type:int
@export var id:int
@warning_ignore("unused_private_class_variable")
@export var _name:String
@export var item:Item
@export var room:Room

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	room = get_room()
	get_item()
	if item != null:
		load_item()
	else:
		load_empty()

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func load_item():
	if item != null:
		var source_size:Vector2i = item.source_size
		var delta_pos:Vector2i = item.delta_pos
		var local_pos:Vector2i = Vector2i(1,2)
		if item.scene_id != -1:
			item_tile.position = Vector2(8,-8)
			item_tile.set_cell(local_pos,7,Vector2i(0,0),item.scene_id)
			if item.type == 2:
				item_tile.position = Vector2(0,-16)
		elif item.pattern_id == -1:
			item_tile.position = Vector2(0,-8)
			for x in source_size.x:
				for y in source_size.y:
					var cell:Vector2i = Vector2i(x,y)+delta_pos+local_pos
					var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
					item_tile.set_cell(cell,0,source_pos,0)
		else:
			item_tile.position = Vector2(8,-8)
			item_tile.set_pattern(local_pos+delta_pos,item_tile.tile_set.get_pattern(item.pattern_id))
		name_label.text = str(item.item_name)
		level_label.text = str(item.price)+"G"

func load_empty():
	var source_size:Vector2i = Vector2i(2,3)
	var delta_pos:Vector2i = Vector2i(0,-1)
	var local_pos:Vector2i = Vector2i(1,2)
	for x in source_size.x:
		for y in source_size.y:
			var cell:Vector2i = Vector2i(x,y)+delta_pos+local_pos
			item_tile.set_cell(cell)
	name_label.text = "空"
	level_label.text = ""

func get_item():
	room = get_room()
	if room != null:
		match type:
			0:
				item = room.bed_list[id]
			1:
				item = room.facility_list[id]
			2:
				item = room.decoration_list[id]
	else:
		item = null

func _on_button_pressed() -> void:
	room = get_room()
	if room != null:
		if room.choosed_slot != [type,id]:
			room.choosed_slot = [type,id]
		else:
			room.choosed_slot = []
	get_item()
	load_item()
	#main.update()

func get_room() -> Room:
	@warning_ignore("shadowed_variable")
	var id:int = Data.choosed_id
	if 1<=id and id<=7:
		return Data.room_list[id-1]
	else:
		return null

func update():
	room = get_room()
	get_item()
	if item != null:
		load_item()
	else:
		load_empty()

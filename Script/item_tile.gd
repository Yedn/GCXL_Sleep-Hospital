extends TileMapLayer
class_name ItemTile

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func update():
	for i in Data.room_list:
		var room:Room = Data.room_list[i]
		@warning_ignore("unused_variable")
		var startpos:Vector2i = room.pos
		for id in room.bed_list:
			var bed:Item = room.bed_list[id]
			if bed != null:
				set_bed_tile(bed,room,id)
			else:
				set_bed_empty(room,id)
		for id in room.decoration_list:
			var decoration:Item = room.decoration_list[id]
			if decoration != null:
				set_decoration_tile(decoration,room,id)
			else:
				set_decoration_empty(room,id)
		for id in room.facility_list:
			var facility:Item = room.facility_list[id]
			if facility != null:
				set_facility_tile(facility,room,id)
			else:
				set_facility_empty(room,id)

func set_bed_tile(item:Item,room:Room,id:int):
	var size:Vector2i = item.source_size
	var delta_pos:Vector2i = item.delta_pos
	var room_pos:Vector2i = room.pos
	if item.scene_id != -1:
		set_cell(room_pos+room.bed_pos[id],7,Vector2i(0,0),item.scene_id)
	elif item.pattern_id == -1:
		for x in size.x:
			for y in size.y:
				var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.bed_pos[id]
				var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
				set_cell(cell,0,source_pos,0)
	else:
		set_pattern(room_pos+room.bed_pos[id]+delta_pos,tile_set.get_pattern(item.pattern_id))

func set_bed_empty(room:Room,id:int):
	var size:Vector2i = Vector2i(2,3)
	var delta_pos:Vector2i = Vector2i(0,-1)
	var room_pos:Vector2i = room.pos
	for x in size.x:
		for y in size.y:
			var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.bed_pos[id]
			set_cell(cell)

func set_decoration_tile(item:Item,room:Room,id:int):
	var size:Vector2i = item.source_size
	var delta_pos:Vector2i = item.delta_pos
	var room_pos:Vector2i = room.pos
	if item.scene_id != -1:
		set_cell(room_pos+room.decoration_pos[id],7,Vector2i(0,0),item.scene_id)
	elif item.pattern_id == -1:
		for x in size.x:
			for y in size.y:
				var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.decoration_pos[id]
				var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
				set_cell(cell,0,source_pos,0)
	else:
		set_pattern(room_pos+room.decoration_pos[id]+delta_pos,tile_set.get_pattern(item.pattern_id))

func set_decoration_empty(room:Room,id:int):
	var size:Vector2i = Vector2i(1,1)
	var delta_pos:Vector2i = Vector2i(0,0)
	var room_pos:Vector2i = room.pos
	for x in size.x:
		for y in size.y:
			var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.decoration_pos[id]
			set_cell(cell)

func set_facility_tile(item:Item,room:Room,id:int):
	var size:Vector2i = item.source_size
	var delta_pos:Vector2i = item.delta_pos
	var room_pos:Vector2i = room.pos
	if item.scene_id != -1:
		set_cell(room_pos+room.facility_pos[id],7,Vector2i(0,0),item.scene_id)
	elif item.pattern_id == -1:
		for x in size.x:
			for y in size.y:
				var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.facility_pos[id]
				var source_pos:Vector2i = item.source_pos+delta_pos+Vector2i(x,y) 
				set_cell(cell,0,source_pos,0)
	else:
		set_pattern(room_pos+room.facility_pos[id]+delta_pos,tile_set.get_pattern(item.pattern_id))

func set_facility_empty(room:Room,id:int):
	var size:Vector2i = Vector2i(2,3)
	var delta_pos:Vector2i = Vector2i(0,0)
	var room_pos:Vector2i = room.pos
	for x in size.x:
		for y in size.y:
			var cell:Vector2i = Vector2i(x,y)+delta_pos+room_pos+room.facility_pos[id]
			set_cell(cell)

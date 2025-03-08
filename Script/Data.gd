extends Node

@export var room_list:Dictionary

@export var item_list:Dictionary
@export var money:int = 500
@export var suanli:int = 50
@export var day:int
@export var frame:float

@export var choosed_id:int

@export var bed_num:int = 2
@export var decoration_num:int = 0
@export var facility_num:int = 0

@export var animation_night:bool = false
@export var night:bool = false
@export var animation_morning:bool = false
@export var morning:bool = false

var complete_npc_id:Array
var complete_npc_remark:Array
var complete_npc_pay:Array

var skip_npc_num:int

var line:Array
var line_max:int = 100
var room_startpos:Array = [Vector2i(0,12),Vector2i(7,0),Vector2i(7,12),Vector2i(14,0),Vector2i(14,12),Vector2i(21,0),Vector2i(21,12)]

var item_source_dic:Dictionary = {0:{},1:{},2:{}}

@export var guide_open:bool = false

func load_dic():
	for i in Data.bed_num:
		item_source_dic[0][i] = load("res://Item/bed/"+str(i) +".tres").new()
	for i in Data.facility_num:
		item_source_dic[1][i] = load("res://Item/facility/"+str(i) +".tres").new()
	for i in Data.decoration_num:
		item_source_dic[2][i] = load("res://Item/decoration/"+str(i) +".tres").new()

func reset_all():
	line = []
	complete_npc_id = []
	complete_npc_remark = []
	complete_npc_pay = []
	animation_morning = false
	animation_night = false
	night = false
	morning = false
	for i in 7:
		var room:Room = room_list[i]
		room.npc_list = []
		for id in room.bed_list:
			if room.bed_list[id] != null:
				room.bed_list[id].occupy = false

func _ready():
	reset_num()
	load_dic()
	generate_room()

func generate_room():
	for i in 7:
		var room:Room = Room.new()
		room.id = i
		room.pos = room_startpos[i]
		room_list[i] = room
		room.bed_list ={0:null,1:null}
		room.decoration_list = {0:null,1:null,2:null,3:null}
		room.facility_list = {0:null,1:null,2:null,3:null}
		room0(room)


func room0(room:Room):
	room.bed_num = 2
	room.bed_pos = {0:Vector2i(2,0),1:Vector2i(3,0)}
	room.decoration_num = 4
	room.decoration_pos = {0:Vector2i(0,0),1:Vector2i(5,0),2:Vector2i(1,0),3:Vector2i(4,0)}
	room.facility_num = 4
	room.facility_pos = {0:Vector2i(0,2),1:Vector2i(4,2),2:Vector2i(0,4),3:Vector2i(4,4)}
	match room.id:
		0:
			room.bed_list[0] = load_item(0,0)
			room.decoration_list[0] = load_item(0,2)
			room.facility_list[0] = load_item(1,1)
		1:
			room.bed_list[0] = load_item(0,0)
			room.decoration_list[0] = load_item(1,2)
			room.facility_list[0] = load_item(2,1)
		2:
			room.bed_list[0] = load_item(0,0)
			room.decoration_list[0] = load_item(2,2)
			room.facility_list[0] = load_item(4,1)
		3:
			room.bed_list[0] = load_item(1,0)
			room.decoration_list[0] = load_item(5,2)
			room.facility_list[0] = load_item(5,1)
		4:
			room.bed_list[0] = load_item(2,0)
			room.decoration_list[0] = load_item(4,2)
			room.facility_list[0] = load_item(0,1)
		5:
			room.bed_list[0] = load_item(3,0)
			room.decoration_list[0] = load_item(2,2)
			room.facility_list[0] = load_item(3,1)
		6:
			room.bed_list[0] = load_item(4,0)
			room.decoration_list[0] = load_item(1,2)
			room.facility_list[0] = load_item(1,1)

func reset_dic(dic:Dictionary,num:int):
	for i in num:
		dic[i] = null

func load_item(id:int,type:int) -> Item:
	return Data.item_source_dic[type][id].new()

func reset_num():
	var bed:int = 0
	var decoration:int = 0
	var facility:int = 0
	for file in DirAccess.get_files_at("res://Item/bed/"):
		bed += 1
	for file in DirAccess.get_files_at("res://Item/decoration/"):
		decoration += 1
	for file in DirAccess.get_files_at("res://Item/facility/"):
		facility += 1
	bed_num = bed
	decoration_num = decoration
	facility_num = facility

func _save():
	var data = SaveData.new()
	data.money = Data.money
	data.day = Data.day
	data.frame = Data.frame
	for i in 7:
		var room_scene = PackedScene.new()
		room_scene.pack(Data.room_list[i])
		data.room_list[i] = room_scene
	if OS.get_name() == "Windows":
		ResourceSaver.save(data,"C:/Users/Administrator/AppData/Roaming/Godot/app_userdata/test17/save_%d.tres"%Data.day)

@warning_ignore("shadowed_variable")
func _load(day:int):
	var data:SaveData
	if OS.get_name() == "Windows":
		data = ResourceLoader.load("C:/Users/Administrator/AppData/Roaming/Godot/app_userdata/test17/save_%d.tres"%day) as SaveData
	Data.money = data.money
	Data.day = data.day
	Data.frame = data.frame
	for i in 7:
		Data.room_list[i].queue_free()
	for i in 7:
		Data.room_list[i] = data.room_list[i].instantiate()

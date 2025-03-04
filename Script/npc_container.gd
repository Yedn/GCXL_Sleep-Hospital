extends Node2D
class_name NPCContainer

@onready var accept: Button = $"../Accept"
@onready var reject: Button = $"../Reject"
@onready var window: Control = $"../Window"
@onready var patient: Patient = window.get_node("Table").get_node("Patient")
@onready var summary: Summary = $"../Summary"
@onready var day: Label = $"../Day"
@onready var canvas_modulate: Sprite2D = $"../CanvasModulate"
@onready var time: Label = $"../Time"

@export var npc_scene:PackedScene

var skip:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Data.day = 0
	Data._save()
	#start_day()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Data.day == 9:
		$"../Start".text = "查看结局"
	if Data.animation_night == true:
		accept.disabled = true
	Data.skip_npc_num = skip_npc_num
	if day_time<180 and day_time>0:
		time.text = "时间:%d"%day_time
	else:
		time.text = ""
	day.text = "天数:"+str(Data.day+1)
	if day_time > 0:
		day_time -= delta
	elif day_time <= 0:
		day_time = 0
	if Data.choosed_id-1>=0:
		accept.text = "去 %d号房"%Data.choosed_id
		if Data.line.size()>0:
			accept.disabled = false
		else:
			accept.disabled = true
	else:
		accept.text = "去  号房"
		accept.disabled = true
	if Data.line.size()>0:
		reject.disabled = false
	else:
		reject.disabled = true
	if patient.is_saying == true and reject.disabled == false:
		reject.disabled = true
	if patient.is_saying == true and accept.disabled == false:
		accept.disabled = true
	if Data.choosed_id-1>=0:
		if Data.room_list[Data.choosed_id-1].npc_list.size() >= Data.room_list[Data.choosed_id-1].npc_max:
			accept.disabled = true
	if Data.animation_night == true:
		accept.disabled = true

func _on_npc_button_pressed() -> void:
	var npc:NPC = npc_scene.instantiate()
	npc.global_position = Vector2(-300,50)
	add_child(npc)

var target_room:int
signal accepted
func _on_accept_pressed() -> void:
	target_room = Data.choosed_id-1
	patient.can_ask = false
	patient.button.visible = false
	if skip == false:
		window.table.patient.text_container.phase = 1
	else:
		window.table.patient.text_container.phase = 2
	window.table.patient.text_container.next_phase()
	skip = true
	await duihua_end
	add_complete_npc()
	accepted.emit()
	window.table.patient.timer.start()
	skip_npc_num += 1
	if Data.line.size()>0 and Data.choosed_id-1 >= 0:
		Data.line[0].room = Data.room_list[target_room]
		Data.line[0].target_bed = choose_bed(Data.line[0].room,Data.line[0])
		Data.line.remove_at(0)

func choose_bed(room:Room,npc:NPC) -> int:
	var sum_value:int = 0
	var target:int = -1
	for id in room.bed_list:
		var bed:Item = room.bed_list[id]
		if bed != null:
			if bed.occupy == false:
				var value:int = 0
				for i in 5:
					value += bed.value[i]*npc.trans[i]
				if value > sum_value:
					target = id
					sum_value = value
	if target != -1:
		room.bed_list[target].occupy = true
	return target

func choose_bed_false(room:Room,npc:NPC) -> int:
	var sum_value:int = 0
	var target:int = -1
	for id in room.bed_list:
		var bed:Item = room.bed_list[id]
		if bed != null:
			if bed.occupy == false:
				var value:int = 0
				for i in 5:
					value += bed.value[i]*npc.trans[i]
				if value > sum_value:
					target = id
					sum_value = value
	return target

signal rejected
func _on_reject_pressed() -> void:
	reject_npc_num += 1
	patient.can_ask = false
	patient.button.visible = false
	window.table.patient.text_container.phase = 4
	window.table.patient.text_container.start()
	await duihua_end
	add_complete_npc()
	rejected.emit()
	if Data.line.size()>0:
		Data.line.remove_at(0)

func add_complete_npc():
	complete_npc += 1
	if complete_npc == npc_num and Data.day <= 2:
		await get_tree().create_timer(5.0).timeout
		day_out()
	elif Data.day > 2 and (day_time <= 0 or complete_npc == npc_num):
		await get_tree().create_timer(5.0).timeout
		day_out()

func add_free_npc():
	free_npc_num += 1
	if free_npc_num == npc_num:
		day_end()

signal duihua_end

func start_day():
	#reset_all()
	match Data.day:
		0:day0()
		1:day1()
		2:day2()
		3:day3()
		4:day4()
		5:day5()
		6:day6()
		7:day7()
		8:day8()

func day_out():
	Data.animation_night = true
	await get_tree().create_timer(10.0).timeout
	Data.animation_morning = true

func day_end():
	summary.reject_npc_num = reject_npc_num
	summary.complete_npc_num = npc_num - reject_npc_num
	summary.update()
	summary.display = true

var npc_num:int = 6
var complete_npc:int = 0
var free_npc_num:int = 0
var reject_npc_num:int = 0
var skip_npc_num:int = 0
func day0():
	npc_num = 6
	var npc_list:Array = [0,1,4,2,5,3]
	#npc_num = 1
	#var npc_list:Array = [14]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func day1():
	npc_num = 6
	var npc_list:Array = [8,10,6,7,9,11]
	#npc_num = 1
	#var npc_list:Array = [12]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func day2():
	npc_num = 6
	var npc_list:Array = [12,15,16,13,14,17]
	#npc_num = 1
	#var npc_list:Array = [14]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

var day_time:float = 0
func day3():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [48,67,54,58,59,50,27,26,77,68]
	for i in npc_num:
		if Data.animation_night != true:
			generate_npc(npc_list[i])
			await get_tree().create_timer(randf_range(5,10)).timeout
		else:
			add_free_npc()

func day4():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [24,62,40,66,36,64,65,55,69,42]
	for i in npc_num:
		if Data.animation_night != true:
			generate_npc(npc_list[i])
			await get_tree().create_timer(randf_range(5,10)).timeout
		else:
			add_free_npc()

func day5():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [72,51,57,73,53,30,28,52,32,74]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func day6():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [43,44,39,56,35,29,63,38,61,20]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func day7():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [47,19,21,22,23,25,71,60,46,37]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func day8():
	npc_num = 10
	day_time = 180
	var npc_list:Array = [41,45,70,33,75,18,49,34,31,76]
	for i in npc_num:
		generate_npc(npc_list[i])
		await get_tree().create_timer(randf_range(5,10)).timeout

func generate_npc(id:int):
	var npc:NPC = npc_scene.instantiate()
	npc.id = id
	npc.global_position = Vector2(-450,50)
	add_child(npc)

func reset_all():
	npc_num = 0
	complete_npc = 0
	free_npc_num = 0
	reject_npc_num = 0
	target_room = 0
	skip_npc_num = 0
	canvas_modulate.reset()
	Data.reset_all()


func _on_start_pressed() -> void:
	if Data.day <= 8:
		reset_all()
		start_day()
		$"../Start".visible = false
		$"../Config".visible = false
		$"../ConfigButton".visible = false
	else:
		if Data.frame < 80:
			$"../Ending0".visible = true
		elif Data.frame < 120:
			$"../Ending1".visible = true
		else:
			$"../Ending2".visible = true

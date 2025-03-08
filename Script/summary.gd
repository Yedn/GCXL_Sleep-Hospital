extends Control
class_name Summary

@onready var rich_text_label: RichTextLabel = $ScrollContainer/GridContainer/RichTextLabel
@export var slot_scene:PackedScene
@onready var main:Main = get_node("/root/Main")
@onready var config_button = main.get_node("ConfigButton")

var startpos:float = 450
var endpos:float = -75

var complete_npc_num:int
var reject_npc_num:int
var total_money:int
var a_remark_num:int
var b_remark_num:int
var c_remark_num:int
var skip_npc_num:int

var display:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if display == true:
		position = position.lerp(Vector2(-424,endpos),10*delta)
	else:
		position = position.lerp(Vector2(-424,startpos),10*delta)

func update():
	skip_npc_num = Data.skip_npc_num
	@warning_ignore("unused_variable")
	var remark_num:int = a_remark_num+b_remark_num+c_remark_num
	total_money = 0
	for i in Data.complete_npc_pay:
		total_money += i
	a_remark_num = 0
	b_remark_num = 0
	c_remark_num = 0
	for i in Data.complete_npc_remark:
		if i == 0:
			c_remark_num += 1
		if i == 1:
			b_remark_num += 1
		if i == 2:
			a_remark_num += 1
	rich_text_label.text = "接收患者数:%d\n拒绝患者数:%d\n\n评价统计:\n极好:%d  好:%d  差:%d\n\n总收益:%d"%[skip_npc_num,reject_npc_num,a_remark_num,b_remark_num,c_remark_num,total_money]
	generate_slot()

func generate_slot():
	var i = 0
	for id in Data.complete_npc_id:
		var slot:RemarkSlot = slot_scene.instantiate()
		slot.id = id
		slot.remark = Data.complete_npc_remark[i]
		slot.pay = Data.complete_npc_pay[i]
		i += 1
		$ScrollContainer/GridContainer.add_child(slot)

func _on_button_pressed() -> void:
	display = false
	config_button.visible = true
	#Data._save()
	Data.day += 1
	Data._save()
	$"../Start".visible = true
	await get_tree().create_timer(2).timeout
	reset_all()


func _on_button_button_down() -> void:
	display = true

func reset_all():
	complete_npc_num = 0
	reject_npc_num = 0
	total_money = 0
	a_remark_num = 0
	b_remark_num = 0
	c_remark_num = 0
	for child in $ScrollContainer/GridContainer.get_children():
		if child.name != "Control" and child.name != "RichTextLabel":
			child.queue_free()

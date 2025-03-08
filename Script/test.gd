extends Control
class_name Test

@export var questions:Dictionary
@export var id:int = 0
@export var choose_id:int = 0
@export var complete:bool = false
var question_path:String = "res://CSV/出题.csv"

@onready var question: Label = $VBoxContainer/Question
@onready var a: Button = $VBoxContainer/A
@onready var b: Button = $VBoxContainer/B
@onready var c: Button = $VBoxContainer/C
@onready var d: Button = $VBoxContainer/D
@onready var answer: Label = $VBoxContainer/Answer
@onready var button: Button = $Button

@export var nodes:Array[Button]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questions = FileLoad.read_question(question_path)
	questions[0] = ["说明：\n在算力中心中，你可以用金钱换取算力。\n接下来，游戏将为你提出一些有关现实中医院智能化的单选题，你可以花费10G进行一次答题，每答对一道题可获取30P算力，只有完成当前答题才能进入下一道题。\n\n点击下方按钮开始答题。","","","","","",""]
	#update()

func _process(delta: float) -> void:
	update()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func update() -> void:
	var correct:int = -1
	match questions[id][1]:
		'A':correct = 0
		'B':correct = 1
		'C':correct = 2
		'D':correct = 3
	question.text = questions[id][0]
	a.text = "A."+questions[id][2]
	b.text = "B."+questions[id][3]
	c.text = "C."+questions[id][4]
	d.text = "D."+questions[id][5]
	answer.text = "\n"+questions[id][6]
	if complete == false:
		choose_id = -1
		for button in nodes:
			button.self_modulate = Color(1,1,1,1)
	else:
		for button in nodes:
			var i:int = nodes.find(button)
			if i == correct:
				button.self_modulate = Color(0,1,0,1)
			if i == choose_id and choose_id != correct:
				button.self_modulate = Color(1,0,0,1)
	if id == 0:
		a.visible = false
		b.visible = false
		c.visible = false
		d.visible = false
		answer.visible = false
		button.visible = true
		button.text = "开始答题"
	else:
		a.visible = true
		b.visible = true
		c.visible = true
		d.visible = true
		button.text = "下一题"
	if id != 0:
		answer.visible = complete
		button.visible = complete


func _on_button_pressed() -> void:
	complete = false
	if id+1 <= questions.size()-1:
		id += 1
	else:
		id = 1
	#update()


func _on_a_pressed() -> void:
	if complete == false:
		complete = true
		Data.money -= 10
		choose_id = 0
		var correct:int = -1
		match questions[id][1]:
			'A':correct = 0
			'B':correct = 1
			'C':correct = 2
			'D':correct = 3
		if correct == choose_id:
			Data.suanli += 3


func _on_b_pressed() -> void:
	if complete == false:
		complete = true
		Data.money -= 10
		choose_id = 1
		var correct:int = -1
		match questions[id][1]:
			'A':correct = 0
			'B':correct = 1
			'C':correct = 2
			'D':correct = 3
		if correct == choose_id:
			Data.suanli += 3


func _on_c_pressed() -> void:
	if complete == false:
		complete = true
		choose_id = 2
		Data.money -= 10
		var correct:int = -1
		match questions[id][1]:
			'A':correct = 0
			'B':correct = 1
			'C':correct = 2
			'D':correct = 3
		if correct == choose_id:
			Data.suanli += 3


func _on_d_pressed() -> void:
	if complete == false:
		complete = true
		choose_id = 3
		Data.money -= 10
		var correct:int = -1
		match questions[id][1]:
			'A':correct = 0
			'B':correct = 1
			'C':correct = 2
			'D':correct = 3
		if correct == choose_id:
			Data.suanli += 3


func _on_button_2_pressed() -> void:
	visible = false

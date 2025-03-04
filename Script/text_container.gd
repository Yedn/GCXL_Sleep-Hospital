extends Control
class_name TextContainer

@export var text_scene:PackedScene
@onready var patient: Patient = $".."

var target_y:float = 0

var duihua_id:int = 0
var duihua:Array

var sum_text_num:int
var now_text_num:int = 0

var wait_time:float = 2.0
var time_left:float

var phase:int = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	duihua = TextData.text[duihua_id]

var speed:float = 25
func _process(delta: float) -> void:
	if time_left>=0:
		time_left -= delta
	else:
		timeout()
		time_left = wait_time
	position = position.move_toward(Vector2(160,-20*(sum_text_num-now_text_num)+10),delta*speed)

func generate_text(id:int,phase:int):
	time_left = wait_time
	now_text_num += 1
	var text:Text = text_scene.instantiate()
	text.right = bool(int(duihua[phase][id][0]))
	text.text = duihua[phase][id].right(-1)
	text.endpos_y = 20*sum_text_num
	text.position = Vector2(0,20*sum_text_num)
	add_child(text)
	sum_text_num = get_child_count()

var now_id:int = 0
func _on_button_pressed() -> void:
	if phase == 0 and duihua[1] != []:
		next_phase()
		patient.can_ask = false
		$"../Button".visible = false
		patient.npc_container.skip = false

func next_phase():
	if phase <= 2:
		phase += 1
	else:
		phase = -1
	start()

func timeout() -> void:
	if now_text_num >= 1:
		now_text_num -= 1

func start():
	speed = 25
	time_left = wait_time
	patient.is_saying = true
	for i in duihua[phase].size():
		generate_text(i,phase)
		await get_tree().create_timer(1.5).timeout
	if phase == 0:
		patient.can_ask = true
	if phase == 2 or phase == 4 or phase == 3:
		now_text_num = 0
		speed = 100
		await get_tree().create_timer(1.0).timeout
		patient.duihua_end.emit()
	patient.is_saying = false

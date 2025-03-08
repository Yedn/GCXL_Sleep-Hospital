extends Control
class_name Patient

@onready var timer: Timer = $Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animated_sprite_2d_2: AnimatedSprite2D = $AnimatedSprite2D2
@onready var timer_2: Timer = $Timer2
@onready var text_container: TextContainer = $TextContainer
@onready var window:WindowUI = get_parent().get_parent()
@onready var main:Main = window.get_parent()
@onready var npc_container = main.get_node("NPC")
@onready var button: Button = $Button

var startpos:float = -90
var endpos:float = 90

var patient0:NPC
var patient1:NPC

var phase:int = -1

var is_saying:bool = false
var can_ask:bool = false

var frame_dic:Dictionary
func _ready() -> void:
	var i:int = 0
	for file in DirAccess.get_files_at("res://Animation/"):
		frame_dic[i] = load("res://Animation/"+str(i)+".tres")
		i += 1

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	patient0 = get_patient(0)
	patient1 = get_patient(1)
	animated_sprite_2d.visible = true
	animated_sprite_2d_2.visible = true
	if patient0 == null and phase != 2:
		phase = -1
	if patient0 != null and (phase == -1 or phase == 3):
		phase = 0
		text_container.duihua = TextData.text[patient0.duihua]
	if phase == 1 and can_ask == true:
		button.visible = true
	else:
		button.visible = false
	if phase == 0:
		if patient0 != null:
			if patient0.id>=0:
				animated_sprite_2d.sprite_frames = frame_dic[patient0.id]
				animated_sprite_2d_2.sprite_frames = frame_dic[patient0.id]
		is_saying = true
		if timer.is_stopped() == true:
			timer.start()
		var percent:float = 1-timer.time_left/timer.wait_time
		animated_sprite_2d.position.x = startpos+(endpos-startpos)*percent
		animated_sprite_2d.animation = "walk_right"
		animated_sprite_2d_2.position.x = 180+endpos
		#animated_sprite_2d_2.animation = "default"
		animated_sprite_2d_2.visible = false
	elif phase == 1:
		
		animated_sprite_2d.position.x = endpos
		animated_sprite_2d.animation = "idle_down"
		animated_sprite_2d_2.position.x = 180+endpos
		#animated_sprite_2d_2.animation = "default"
		animated_sprite_2d_2.visible = false
	elif phase == 2:
		if timer_2.is_stopped() == true:
			timer_2.start()
		var percent:float = 1-timer_2.time_left/timer_2.wait_time
		animated_sprite_2d_2.position.x = 180+startpos+(endpos-startpos)*percent
		animated_sprite_2d_2.animation = "walk_right"
		#animated_sprite_2d.animation = "default"
		animated_sprite_2d.visible = false
		animated_sprite_2d.position.x = startpos
	elif phase == 3:
		animated_sprite_2d_2.position.x = 180+endpos
		#animated_sprite_2d_2.animation = "default"
		animated_sprite_2d_2.visible = false
		#animated_sprite_2d.animation = "default"
		animated_sprite_2d.visible = false
		animated_sprite_2d.position.x = startpos
		if patient0 != null:
			if patient0.id>=0:
				animated_sprite_2d.sprite_frames = frame_dic[patient0.id]
				animated_sprite_2d_2.sprite_frames = frame_dic[patient0.id]
	elif phase == -1:
		#animated_sprite_2d.animation = "default"
		animated_sprite_2d.visible = false
		animated_sprite_2d.position.x = startpos
		animated_sprite_2d_2.position.x = 180+endpos
		#animated_sprite_2d_2.animation = "default"
		animated_sprite_2d_2.visible = false
		if patient0 != null:
			if patient0.id>=0:
				animated_sprite_2d.sprite_frames = frame_dic[patient0.id]
				animated_sprite_2d_2.sprite_frames = frame_dic[patient0.id]

func get_patient(i:int) -> NPC:
	if i<Data.line.size():
		return Data.line[i]
	else:
		return null


func _on_timer_timeout() -> void:
	if phase == 0:
		phase = 1


func _on_timer_2_timeout() -> void:
	if phase == 2:
		phase = 3

@warning_ignore("unused_signal")
signal duihua_end


func _on_duihua_end() -> void:
	Data.line[0].queue.duihua_end = true
	npc_container.duihua_end.emit()

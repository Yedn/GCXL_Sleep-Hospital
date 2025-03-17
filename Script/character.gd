extends CharacterBody2D
class_name NPC

@onready var animated: AnimatedSprite2D = $AnimatedSprite2D
@onready var npc_container:NPCContainer = get_parent()
@onready var tile:Node2D = npc_container.get_parent().get_node("Tilemap")
@onready var item_tile:TileMapLayer = tile.get_node("Item")
@onready var main:Main = npc_container.get_parent()
@onready var window:WindowUI = main.get_node("Window")
@onready var table:Table = window.get_node("Table")
@onready var patient:Patient = table.get_node("Patient")
@onready var queue: Queue = $StateMachine/Queue
@onready var emotion: Emotion = $Emotion
@onready var particle: GPUParticles2D = $Particle

@export var duihua:int = 0

@export var move_speed:float = 100
@export var room:Room

@export var id:int = 0
@export var type:int = 0
@export var demand:Array = [50,100]
@export var trans:Array = [20,10,10,5,15]
@export var money_array:Array = [100,200,300]
@export var frame_array:Array = [0,1,2]
@onready var sprite_2d: Sprite2D = $Sprite2D

var point:int = 0
var remark:int
var move_direction:Vector2

var emo_id:int = -1
var emo_play:bool = true

var target_bed:int = -1

var sleep_angry:bool = false

var hulu:bool = false
var mengyou:bool = false
var niao:bool = false

func _ready() -> void:
	if NpcData.hulu_data.find(id) != -1:
		type = 1
	if NpcData.mengyou_data.find(id) != -1:
		type = 2
	if NpcData.yiniao_data.find(id) != -1:
		type = 3
	demand = NpcData.data[id][0]
	trans = NpcData.data[id][1]
	money_array = NpcData.data[id][2]
	duihua = NpcData.data[id][3]
	animated.sprite_frames = load("res://Animation/"+str(id)+".tres")
	animated.play("idle_down")

@onready var timer: Timer = $Sprite2D/Timer
@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	#sprite_2d.global_position = global_position
	if niao == true:
		particle.visible = true
	else:
		particle.visible = false
	if hulu == true:
		sprite_2d.visible = true
	else:
		sprite_2d.visible = false
	var pos:Vector2 = global_position-Vector2(-424,-75)
	@warning_ignore("integer_division")
	var loc:Vector2 = Vector2(pos.x-(864-486)/2,pos.y-10)/486
	sprite_2d.material.set_shader_parameter("center",loc)
	var percent:float = 1-timer.time_left/timer.wait_time
	sprite_2d.material.set_shader_parameter("size",0.3*percent)
	sprite_2d.material.set_shader_parameter("force",0.01*(1-percent))
	velocity = move_direction*move_speed
	move_and_slide()
	if velocity.length()>0:
		if abs(velocity.x)>=abs(velocity.y):
			if velocity.x > 0:
				animated.animation = "walk_right"
			else:
				animated.animation = "walk_left"
		else:
			if velocity.y < 0:
				animated.animation = "walk_up"
			else:
				animated.animation = "walk_down"
	else:
		match animated.animation:
			"walk_right":animated.animation = "idle_right"
			"walk_left":animated.animation = "idle_left"
			"walk_up":animated.animation = "idle_up"
			"walk_down":animated.animation = "idle_down"

func to_remark():
	if point < demand[0]:
		remark = 0
	elif point >= demand[0] and point < demand[1]:
		remark = 1
	else:
		remark = 2
	if sleep_angry == true:
		remark = 0

func compute():
	point = 0
	var value:Array = compute_room_value(room,target_bed)
	for i in 5:
		point += trans[i]*value[i]
	print("%d房 %d床 %d"%[room.id+1,target_bed+1,point])

@warning_ignore("shadowed_variable")
func compute_room_value(room:Room,target_bed:int) -> Array:
	var value:Array = [0,0,0,0,0]
	if target_bed != -1:
		for j in 5:
			if room.bed_list[target_bed]!=null:
				value[j] += room.bed_list[target_bed].value[j]
		for id in room.decoration_list:
			for j in 5:
				if room.decoration_list[id]!=null:
					value[j] += room.decoration_list[id].value[j]
		for id in room.facility_list:
			for j in 5:
				if room.facility_list[id]!=null:
					value[j] += room.facility_list[id].value[j]
	return value

func result():
	Data.money += money_array[remark]
	Data.frame += frame_array[remark]

func emo_restart():
	await get_tree().process_frame
	emotion._on_timer_timeout()

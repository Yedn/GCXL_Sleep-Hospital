extends State
class_name Sleep

@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."
@onready var timer: Timer = $Timer

func enter():
	character.emo_play = true
	character.emo_id = 1
	character.emo_restart()
	var id:int = character.room.npc_list.find(character)
	var cell:Vector2i = character.room.pos+character.room.bed_pos[character.target_bed]
	character.animated.animation = "sleep"
	character.global_position = map_to_local(cell)+Vector2(0,6)
	timer.start()
	character.compute()
	character.to_remark()
	await get_tree().create_timer(3).timeout
	if character.remark < 2:
		if character.type == 1:
			character.hulu = true
		elif character.type == 2:
			character.mengyou = true
		elif character.type == 3:
			character.niao = true

func exit():
	pass

func update(delta:float):
	for npc in character.room.npc_list:
		if npc != character:
			if npc.hulu == true:
				character.sleep_angry = true
	if character.sleep_angry == true:
		character.emo_id = 9
		character.emo_restart()
	elif character.mengyou == true:
		transition.emit(self,"MengYou")
	elif character.niao == true:
		pass
	if Data.morning == true:
		transition.emit(self,"GetUp")

func physics_update(delta:float):
	pass

func map_to_local(pos:Vector2i) -> Vector2:
	return Vector2(pos*16)+Vector2(8,8)


func _on_timer_timeout() -> void:
	pass

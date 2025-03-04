extends State
class_name GetUp

@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."
@onready var navigation: NavigationAgent2D = $"../../Navigation/Navigation_GetUp"

func enter():
	character.compute()
	character.to_remark()
	var remark:int = character.remark
	match remark:
		0:
			character.emo_play = true
			character.emo_id = 9
		1:
			character.emo_play = false
			character.emo_id = 1
		2:
			character.emo_play = true
			character.emo_id = 4
	character.emo_restart()
	character.move_speed = 100
	character.global_position += Vector2(0,32)
	navigation.target_position = map_to_local(Vector2i(36,8))
	character.mengyou = false
	character.niao = false
	character.hulu = false

func exit():
	pass

func update(delta:float):
	pass

func physics_update(delta:float):
	if navigation.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation.get_next_path_position()).normalized()


func _on_navigation_get_up_navigation_finished() -> void:
	if state_machine.current_state == self:
		character.result()
		Data.complete_npc_id.append(character.id)
		Data.complete_npc_remark.append(character.remark)
		Data.complete_npc_pay.append(character.money_array[character.remark])
		character.npc_container.add_free_npc()
		character.queue_free()

func map_to_local(pos:Vector2i) -> Vector2:
	return Vector2(pos*16)+Vector2(8,8)

extends State
class_name GoBed

@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."
@onready var navigation: NavigationAgent2D = $"../../Navigation/Navigation_GoBed"

func enter():
	character.emo_play = true
	character.emo_id = 1
	character.emo_restart()
	character.move_speed = 50
	#var id:int = character.room.npc_list.find(character)
	var cell:Vector2i = character.room.pos+character.room.bed_pos[character.target_bed]
	navigation.target_position = map_to_local(cell)

func exit():
	pass

@warning_ignore("unused_parameter")
func update(delta:float):
	pass

@warning_ignore("unused_parameter")
func physics_update(delta:float):
	if navigation.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation.get_next_path_position()).normalized()


func _on_navigation_go_bed_navigation_finished() -> void:
	if state_machine.current_state == self:
		character.move_direction = Vector2(0,0)
		transition.emit(self,"Sleep")

func map_to_local(pos:Vector2i) -> Vector2:
	return Vector2(pos*16)+Vector2(8,8)

extends State
class_name GoRoom

@onready var character:NPC = $"../.."
@onready var navigation_agent_2d: NavigationAgent2D = $"../../Navigation/Navigation_GoRoom"
@onready var state_machine: StateMachine = $".."

func enter():
	character.emo_play = true
	character.emo_id = -1
	character.emo_restart()

func exit():
	pass

@warning_ignore("unused_parameter")
func update(delta:float):
	pass

@warning_ignore("unused_parameter")
func physics_update(delta:float):
	if navigation_agent_2d.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation_agent_2d.get_next_path_position()).normalized()

func _on_timer_timeout() -> void:
	if character.room != null and state_machine.current_state == self:
		navigation_agent_2d.target_position = character.item_tile.map_to_local(Data.room_startpos[character.room.id]+Vector2i(2,2))+Vector2(8,8)


func _on_navigation_go_room_navigation_finished() -> void:
	character.move_speed = 10
	if Data.night == true:
		transition.emit(self,"GoBed")

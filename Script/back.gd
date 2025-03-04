extends State
class_name Back

@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."
@onready var navigation: NavigationAgent2D = $"../../Navigation/Navigation_Back"

var target:Array = [Vector2i(3,5),Vector2i(-37,5)]
func enter():
	character.emo_play = true
	character.emo_id = 10
	#character.position += Vector2(0,16)
	character.emo_restart()
	navigation.target_position = map_to_local(target[0])

func exit():
	pass

func update(delta:float):
	pass

func physics_update(delta:float):
	if navigation.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation.get_next_path_position()).normalized()


func _on_navigation_back_navigation_finished() -> void:
	if state_machine.current_state == self and target.size()==1:
		character.npc_container.add_free_npc()
		character.queue_free()
	if target.size()==2:
		navigation.target_position = map_to_local(target[1])
		target.remove_at(0)

func map_to_local(pos:Vector2i) -> Vector2:
	return Vector2(pos*16)+Vector2(8,8)

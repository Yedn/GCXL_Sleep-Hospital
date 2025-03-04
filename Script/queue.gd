extends State
class_name Queue

@onready var character:NPC = $"../.."
@onready var navigation_agent_2d: NavigationAgent2D = $"../../Navigation/Navigation_Queue"
@onready var state_machine: StateMachine = $".."

var line_pos:Vector2 = Vector2(48,40)
var delta_pos:Vector2 = Vector2(-32,0)

func enter():
	character.emo_id = -1
	var n:int = Data.line.find(character)
	if n<Data.line.size() and state_machine.current_state == self:
		character.move_direction = Vector2(0,0)
		if n != 0:
			character.emo_play = true
		else:
			character.emo_play = false
	character.emo_restart()
	navigation_agent_2d.target_desired_distance = 3
	if Data.line.size()<Data.line_max:
		Data.line.append(character)
	else:
		await get_tree().process_frame
		transition.emit(self,"Idle")

func exit():
	if Data.line.has(character):
		Data.line.remove_at(Data.line.find(character))

var duihua_end:bool = false
func update(delta:float):
	if character.room != null and duihua_end == true:
		character.room.npc_list.append(character)
		transition.emit(self,"GoRoom")
	elif character.room == null and duihua_end == true:
		transition.emit(self,"Back")
	elif Data.line.size() > 0:
		if Data.animation_night == true and Data.line[0] != character:
			transition.emit(self,"Back")

func physics_update(delta:float):
	if navigation_agent_2d.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation_agent_2d.get_next_path_position()).normalized()

func _on_timer_timeout() -> void:
	if Data.line.find(character)<Data.line.size() and state_machine.current_state == self:
		navigation_agent_2d.target_position = line_pos+delta_pos*Data.line.find(character)

var say:bool = false
func _on_navigation_queue_navigation_finished() -> void:
	var n:int = Data.line.find(character)
	if n<Data.line.size() and state_machine.current_state == self:
		character.move_direction = Vector2(0,0)
		if n != 0:
			character.emo_play = true
			character.animated.animation = "idle_right"
		else:
			character.emo_play = false
			character.animated.animation = "idle_up"
			if say == false:
				say = true
				await get_tree().create_timer(1.0).timeout
				character.patient.text_container.phase = -1
				character.patient.text_container.next_phase()

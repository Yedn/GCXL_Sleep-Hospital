extends State
class_name Idle

@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."
@onready var navigation: NavigationAgent2D = $"../../Navigation/Navigation_Idle"
@onready var timer: Timer = $Timer

var line_pos:Vector2 = Vector2(48,40)
var delta_pos:Vector2 = Vector2(-32,0)
var wander_time:float

func random_endpos():
	navigation.target_position = character.global_position+Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()*30

func enter():
	character.emo_id = -1
	character.emo_play = true
	character.emo_restart()
	character.move_speed = 100
	character.move_direction = Vector2(0,0)
	#random_endpos()

func update(delta:float):
	pass
	#if wander_time > 0:
		#wander_time -= delta
	#else:
		#random_endpos()
		#wander_time = 3
	#if character.room!=null:
		#transition.emit(self,"GoRoom")
	

func physics_update(delta:float):
	if navigation.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation.get_next_path_position()).normalized()


func _on_navigation_idle_navigation_finished() -> void:
	transition.emit(self,"Queue")


func _on_timer_timeout() -> void:
	if state_machine.current_state == self:
		navigation.target_position = line_pos+delta_pos*(Data.line.size())

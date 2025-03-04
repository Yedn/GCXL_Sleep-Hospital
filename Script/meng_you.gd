extends State
class_name MengYou

@onready var navigation: NavigationAgent2D = $"../../Navigation/Navigation_MengYou"
@onready var character:NPC = $"../.."
@onready var state_machine: StateMachine = $".."

var wander_time:float

func random_endpos():
	navigation.target_position = character.global_position+Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()*30

func enter():
	character.emo_play = true
	character.emo_id = 1
	character.emo_restart()
	character.move_speed = 10
	character.global_position += Vector2(0,32)
	random_endpos()

func exit():
	pass

func update(delta:float):
	if wander_time > 0:
		wander_time -= delta
	else:
		random_endpos()
		wander_time = 3
	if Data.morning == true:
		transition.emit(self,"GetUp")

func physics_update(delta:float):
	if navigation.is_navigation_finished() == false:
		character.move_direction = character.to_local(navigation.get_next_path_position()).normalized()

func _on_navigation_meng_you_navigation_finished() -> void:
	pass # Replace with function body.

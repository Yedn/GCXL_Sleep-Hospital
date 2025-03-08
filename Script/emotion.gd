extends Node2D
class_name Emotion

@export var speed:float = 2
@export var time:float = 5
@export var play:bool = true

@onready var emotion_0: AnimatedSprite2D = $Emotion0
@onready var emotion_1: AnimatedSprite2D = $Emotion1
@onready var timer: Timer = $Timer
@onready var character: NPC = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	emotion_0.speed_scale = speed
	emotion_1.speed_scale = speed
	timer.wait_time = time


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	play = character.emo_play
	emotion_0.visible = play
	emotion_1.visible = play
	if play == true:
		var id:int = character.emo_id
		if character.emo_id == -1:
			id = randi_range(1,8)
		emotion_0.visible = true
		emotion_1.visible = true
		emotion_0.play(str(1))
		emotion_1.play(str(id))

func to_play():
	play = true
	_on_timer_timeout()
	timer.start()

func to_stop():
	play = false
	_on_timer_timeout()
	timer.stop()

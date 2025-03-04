extends Sprite2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var night_animation_percent:float = 0
var morning_animation_percent:float = 0

func reset():
	night_animation_percent = 0
	morning_animation_percent = 0

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	animation_player.play("back")
	if Data.animation_night == true and Data.animation_morning == false:
		if night_animation_percent>=0.3:
			Data.night = true
		if night_animation_percent<1:
			night_animation_percent += delta*0.2
		else:
			night_animation_percent = 1
		animation_player.seek(17+(24-17)*night_animation_percent)
	elif Data.animation_night == true and Data.animation_morning == true:
		if morning_animation_percent>=0.8:
			Data.morning = true
		if morning_animation_percent<1:
			morning_animation_percent += delta*0.1
		else:
			morning_animation_percent = 1
		animation_player.seek(0+(9-0)*morning_animation_percent)
	else:
		Data.night = false
		night_animation_percent = 0
		animation_player.seek(12)
	

extends AnimatedSprite
#	   2
#	   |     facing
#   1-- --1
#	   |
#	   3

var facing = 1

func is_idle():
	if (Input.is_action_pressed("ui_right") ||Input.is_action_pressed("ui_left") ||Input.is_action_pressed("ui_up") ||Input.is_action_pressed("ui_down")):
		return false
	else:
		return true

func get_input():
	if Input.is_action_pressed("ui_right"):
		set_flip_h(false)
		facing=1
		play("walkhorizontal")
		
	elif Input.is_action_pressed("ui_left"):
		set_flip_h(true)
		facing=1
		play("walkhorizontal")

	elif (Input.is_action_pressed("ui_up") && !(Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"))):
			facing=2
			play("walkup")

	elif (Input.is_action_pressed("ui_down") && !(Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_right"))):
			facing=3
			play("walkdown")
	
	if(is_idle()):
		if (facing == 1):
			if(Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left")):
				play("toidlehorizontal")
			elif(frame == 4):
				play("idlehorizontal")
				
		elif (facing == 2):
			if(Input.is_action_just_released("ui_up")):
				play("toidleup")
			elif(frame == 4):
				play("idleup")
		
		elif (facing == 3):
			if(Input.is_action_just_released("ui_down")):
				play("toidledown")
			elif(frame == 4):
				play("idledown")

func _process(delta):
	get_input()

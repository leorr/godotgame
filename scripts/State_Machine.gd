extends  Node
class_name StateMachine

var state = null setget set_state
var previous_state = null
var states = {}

onready var parent = get_parent()


func _process(delta):
	if state != null:
		_refresh(delta)
		var transition = _update_state(delta)
		if transition != null:
			set_state(transition)

func _refresh(delta):
	pass

func _update_state(delta):
	return null

func _enter_state(new_state,old_state):
	pass

func _exit_state(old_state,new_state):
	pass

func set_state(new_state):
	previous_state = state
	state = new_state
	if previous_state != null:
		_exit_state(previous_state, new_state)
	if new_state != null :
		_enter_state(new_state,previous_state)

func add_state(state_name):
	states[state_name] = states.size()

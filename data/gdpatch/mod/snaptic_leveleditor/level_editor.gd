extends Level

@onready var highlight = $Highlight
@onready var movable_obj: Node3D = highlight.get_child(0)

func _ready() -> void:
	Global.get_player().movement_state_machine.find_child("Noclip").enter_noclip()

func _unhandled_input(event) -> void:
	if event is InputEventKey and highlight.get_child_count() == 1 and event.pressed:
		if event.keycode == KEY_J:
			movable_obj.global_position.x += 1
		elif event.keycode == KEY_L:
			movable_obj.global_position.x -= 1
		elif event.keycode == KEY_I:
			movable_obj.global_position.z += 1
		elif event.keycode == KEY_K:
			movable_obj.global_position.z -= 1
		elif event.keycode == KEY_U:
			movable_obj.global_position.y -= 1
		elif event.keycode == KEY_O:
			movable_obj.global_position.y += 1
		$AxisIndicator.position = movable_obj.global_position
		($AxisIndicator as Node3D).visible = true;

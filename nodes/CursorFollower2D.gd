## A node that just follows the cursor's position in the game world
##
## This node simply positions itself wherever the cursor is positioned in the game world.
## What else can I say about it?
class_name CursorFollower2D
extends Node2D

const PROCESS_FUNC = "_process"
const PHYSICS_PROCESS_FUNC = "_physics_process"

## Which processing function this node should use
@export_enum(PROCESS_FUNC, PHYSICS_PROCESS_FUNC) var process_function = PROCESS_FUNC

func _ready():
	var use_regular_process = process_function == PROCESS_FUNC
	set_process(use_regular_process)
	set_physics_process(not use_regular_process)

func _process(_delta):
	global_position = get_global_mouse_position()

func _physics_process(_delta):
	global_position = get_global_mouse_position()

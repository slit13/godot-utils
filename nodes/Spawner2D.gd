## A node to automatically spawn other objects periodically
##
## Spawner2D will automatically spawn a given scene repetitively
##
## See also [Despawner2D]
class_name Spawner2D
extends Node2D

## The node that Spawner2D will use as a root for its spawned instances (defaults to self is null)
@export var spawner_root: Node2D = null
## The scene to spawn (required)
@export var scene_to_spawn: PackedScene = null
## A [Timer] to control the periodicity of this node (will search children and pick the first
## appropriate one if no specific timer is given
@export var timer: Timer = null

func _ready():
	if not spawner_root:
		spawner_root = self

	if scene_to_spawn:
		assert(scene_to_spawn.can_instantiate(), "%s can't be instantiated, %s has no use for it" % [scene_to_spawn.resource_name, name])
	else:
		push_error("No scene to spawn was given for %s" % name)

	if not timer:
		push_warning("No Timer was given for %s, searching in children" % name)
		for child in get_children():
			if child is Timer:
				timer = child
				break
	if timer:
		timer.connect("timeout", _on_timer_timeout)
	else:
		push_error("No Timer was given or found as a child for %s" % name)

func _on_timer_timeout():
	var instance = scene_to_spawn.instantiate()
	spawner_root.add_child(instance)

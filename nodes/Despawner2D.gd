## A node to automatically despawn other objects
##
## Despawner2D will automatically remove from the node tree any object that enters its area.
## Just position it somewhere, give it a collision shape, and let it do the work.
##
## Note: In order for an object to be dewpawned it must be part of the "despawnable" group and allow for collision checking
##
## See also [Spawner2D]
class_name Despawner2D
extends Area2D

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body: Node2D):
	if body.is_in_group("despawnable"):
		body.queue_free()

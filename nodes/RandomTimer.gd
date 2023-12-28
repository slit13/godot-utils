## A specialized timer with a randomized wait time
##
## This node is a simple specialization of [Timer] where on every timeout, it automatically regenerates a wait time with a random value within a given range
class_name RandomTimer
extends Timer

## The minimum wait time bound
@export_range(0.001, 4096, 0.001, "or_greater", "exp", "suffix:s") var min_wait_time: float = 1.0
## The maximum wait time bound (must be greater than or equal to the minimum)
@export_range(0.001, 4096, 0.001, "or_greater", "exp", "suffix:s") var max_wait_time: float = 1.0

func _ready():
	assert(max_wait_time >= min_wait_time, "Maximum waiting time must be larger than or equal to (>=) the minimum")

	connect("timeout", _on_timer_timeout)

func _on_timer_timeout():
	wait_time = randf_range(min_wait_time, max_wait_time)

extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var initial_pos

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_pos = global_position


func _process(delta):
	print(global_position)
	$Line2D.add_point(global_position-initial_pos)

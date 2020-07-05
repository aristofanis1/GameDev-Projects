extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (float) var G = 100.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta):
	$EarthOrbit.add_point($Earth.global_position)

func _physics_process(delta):
	var dist = $Sun.position.distance_squared_to($Earth.position)
	$Earth.apply_central_impulse(($Sun.position-$Earth.position).normalized()*G*delta*$Sun.mass*$Earth.mass/dist)

extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (float) var G = 100.0;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func apply_gravitational_force(from, to, delta, G_overrite=G) :
	var dist = from.global_position.distance_squared_to(to.global_position)
	to.apply_central_impulse((from.global_position-to.global_position).normalized()*G_overrite*delta*from.mass*to.mass/dist)
	
func _process(delta):
	$EarthOrbit.add_point($Earth.global_position)
	
	if $EarthOrbit.get_point_count() > 2000 :
		$EarthOrbit.remove_point(0) 
		
	$MoonOrbit.add_point($Moon.global_position)
	
	if $MoonOrbit.get_point_count() > 2000 :
		$MoonOrbit.remove_point(0) 

func _physics_process(delta):
	apply_gravitational_force($Sun, $Earth, delta)
	apply_gravitational_force($Sun, $Moon, delta)
	apply_gravitational_force($Earth, $Moon, delta, G*4)
	apply_gravitational_force($Moon, $Earth, delta, G*4)	

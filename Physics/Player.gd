extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$L/Particles2D.set_deferred("emitting", false)
	$R/Particles2D.set_deferred("emitting", false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") :
		apply_impulse($L.position.rotated(rotation), Vector2(0, -1).rotated(rotation))
		$L/Particles2D.set_deferred("emitting", true)
	else :
		$L/Particles2D.set_deferred("emitting", false)
		
	if Input.is_action_pressed("ui_left") :
		apply_impulse($R.position.rotated(rotation), Vector2(0, -1).rotated(rotation))
		$R/Particles2D.set_deferred("emitting", true)
	else :
		$R/Particles2D.set_deferred("emitting", false)
		
	if !Input.is_action_pressed("ui_left") and !Input.is_action_pressed("ui_right") and Input.is_action_pressed("accel") :
		apply_impulse($L.position.rotated(rotation), Vector2(0, -1).rotated(rotation))
		apply_impulse($R.position.rotated(rotation), Vector2(0, -1).rotated(rotation))
		$R/Particles2D.set_deferred("emitting", true)
		$L/Particles2D.set_deferred("emitting", true)
		
	

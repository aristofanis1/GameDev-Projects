extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export (PackedScene) var Zap

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(0, 20000, 8) :
		$Path2D/PathFollow2D.offset = i
		var zap = Zap.instance()
		add_child(zap)
		zap.position = $Path2D/PathFollow2D.position
		zap.rotation = $Path2D/PathFollow2D.rotation



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

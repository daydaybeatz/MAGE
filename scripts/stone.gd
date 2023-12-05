extends Node3D

@onready var stone = $"."
@onready var area_3d = $Area3D
@onready var health=7


# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if self.health<=0:
		queue_free()
	pass



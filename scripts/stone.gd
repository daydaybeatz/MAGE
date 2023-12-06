extends Node3D

@onready var stone = $"."
@onready var area_3d = $Area3D
@onready var health=5

@onready var audio_stream_break = $audio_stream_break

var sfx_break = preload("res://sounds/sfx_break.wav")
var die=false
# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass
func _process(delta):
	print(die)
	if die==true:
		queue_free()
	pass
func _physics_process(delta):
	if self.health<=0:
		if Input.is_action_just_pressed("interact_1") or Input.is_action_just_pressed("interact_1"):
			if not audio_stream_break.is_playing():
				audio_stream_break.stream = sfx_break
				audio_stream_break.play()
			
			
	if self.health>0:
		die=false
	
func _on_audio_stream_break_finished():
	die=true
	pass # Replace with function body.



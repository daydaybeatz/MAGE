extends Node3D

@onready var stone = $"."
@onready var area_3d = $Area3D
@onready var health=5

@onready var gpu_particles_3d = $GPUParticles3D

@onready var audio_stream_break = $audio_stream_break
@onready var audio_stream_hit = $audio_stream_hit

var sfx_break = preload("res://sounds/sfx_break.wav")
var sfx_hit = preload("res://sounds/sfx_hit_1.wav")

var played=false
var die=false
var c=0
# Called when the node enters the scene tree for the first time.
func _ready(): 
	
	gpu_particles_3d.visible=false
	pass
func _process(delta):
	print(die)
	if die==true:
		c+=1
		gpu_particles_3d.visible=true
		self.scale -= Vector3(.03,.04,.04)
		if c>35:
			queue_free()
	pass
func _physics_process(delta):
	
	if Input.is_action_just_pressed("interact_1") and PlayerVariables.L_selector==1 or Input.is_action_just_pressed("interact_2") and PlayerVariables.R_selector==1:
		if self.health==1:
		
			if not audio_stream_break.is_playing() and played==false:
				audio_stream_break.stream = sfx_break
				audio_stream_break.play()
		
		else:
			if not audio_stream_hit.is_playing() and PlayerVariables.collider==self:
				audio_stream_hit.stream = sfx_hit
				audio_stream_hit.play()
			
		
		#PlayerVariables.collider.health
		
	
func _on_audio_stream_break_finished():
	played=true
	die=true
	pass # Replace with function body.



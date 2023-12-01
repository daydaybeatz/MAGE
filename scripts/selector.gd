extends RayCast3D


@onready var stone_label = $"../../../player_gui/stone"

@onready var selector = $"."

@onready var debug = $"../../../player_gui/debug"

@onready var interact = $"../../../player_gui/interact"

var is_entered = false
var c_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	interact.text = str("")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if selector.is_colliding():
		var collider=selector.get_collider()
		print(collider.get_collision_mask_value(2))
		
		if collider.get_collision_mask_value(2)==true: #is stone
			if Input.is_action_pressed("interact"):
				c_timer = c_timer+1
				if c_timer>=30:
					PlayerVariables.stone = PlayerVariables.stone+1
					c_timer=0
			interact.text = str(" E ")
		#if collider.get_collision_mask_value(3)==true: #is wood????
			#if Input.is_action_pressed("interact"):
				#c_timer = c_timer+1
				#if c_timer>=30:
					#PlayerVariables.stone = PlayerVariables.stone+1
					#c_timer=0
			#interact.text = str(" E ")
	else:
		interact.text = str("")
		#if collider.get_collision_mask_value(1)==true:
			#interact.text = str("")
		
		
		
	debug.text = str(selector.get_collider())

extends RayCast3D


#@onready var stone_label = $"../../../player_gui/stone"
@onready var stone_label = $"../../player_gui/AspectRatioContainer2/stone"

@onready var l_arm = $"../l_arm"
@onready var r_arm = $"../r_arm"


@onready var debug = $"../../player_gui/AspectRatioContainer2/debug"

@onready var selector = $"."



@onready var interact = $"../../player_gui/AspectRatioContainer2/interact"



var is_entered = false
var c_timer = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	interact.text = str("")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	#left and right arm, animations
	
	if  Input.is_action_pressed("interact_1"):
		l_arm.rotation_degrees.x=lerp(rad_to_deg(95),rad_to_deg(55),.05)
		l_arm.position.z=lerpf(l_arm.position.z,-1,.5)
		
		
	else:
		l_arm.rotation_degrees.x=-35
		l_arm.position.z=lerpf(l_arm.position.z,2,.5)
		
	
		#l_arm.position.z=2
		
	if  Input.is_action_pressed("interact_2"):
		r_arm.rotation_degrees.x=lerp(rad_to_deg(95),rad_to_deg(55),.05)
		r_arm.position.z=lerpf(r_arm.position.z,-1,.5)
		
	else:
		r_arm.rotation_degrees.x=-35
		r_arm.position.z=lerpf(r_arm.position.z,2,.5)
		
	
	
	
	
	if selector.is_colliding():
		var collider=selector.get_collider()
		#print(collider.get_collision_mask_value(2))
		
		if collider.get_collision_mask_value(2)==true: #is stone
			if PlayerVariables.L_selector>0 and PlayerVariables.L_selector<2 and Input.is_action_just_pressed("interact_1") or PlayerVariables.R_selector>0 and PlayerVariables.R_selector<2 and Input.is_action_just_pressed("interact_2"):
				collider.get_parent().health-=1
				#c_timer = c_timer+1
				#if c_timer>=30:
				PlayerVariables.stone = PlayerVariables.stone+randi_range(1,2)
					#c_timer=0
				interact.text = str(" rmb/lmb ")
					
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

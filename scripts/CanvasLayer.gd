extends CanvasLayer

@onready var l_equip = $ui_l_equip/L_equip
@onready var r_equip = $ui_r_equip/R_equip


#player gui

@onready var stone = $ui_inventory/stone


@onready var stamina = $ui_stats/stamina


# Called when the node enters the scene tree for the first time.
func _ready():
	#stone.add_theme_font_override("stone",my_font)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	stone.text = str("stone: ", PlayerVariables.stone)
	stamina.value = int(PlayerVariables.stamina)
	
	l_equip.text = str(PlayerVariables.L_selector)
	r_equip.text = str(PlayerVariables.R_selector)
	pass

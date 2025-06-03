extends Button

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var fak_sprite = get_node("../fak")
	var zelya_fak_sprite = get_node("../zelya-fak")
	
	fak_sprite.visible = not fak_sprite.visible
	zelya_fak_sprite.visible = not zelya_fak_sprite.visible

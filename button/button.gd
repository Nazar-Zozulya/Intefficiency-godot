extends Button

func _ready():
	pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var fak_sprite = get_node("../fak")  # убедись, что узел называется fak
	fak_sprite.visible = not fak_sprite.visible

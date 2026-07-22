extends Label

var time := 60
var isreal := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isreal == true and time >= 1:
		isreal = false
		await get_tree().create_timer(1.0).timeout
		time -= 1
		text = str(time)
		isreal = true


func _on_texture_button_pressed() -> void:
	time += 1
	text = str(time)

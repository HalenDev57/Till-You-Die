extends Label

var money := 0
var isreal := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(money)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isreal == true:
		isreal = false
		await get_tree().create_timer(1.0).timeout
		money += 1
		text = "$" + str(money)
		isreal = true

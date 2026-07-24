extends Label

@onready var countdown = $"../Countdown"
@onready var cash = $"../Money"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if countdown.time_increase_cost > cash.money:
		position = Vector2(948.0, 470.0)
		text = "X"
	else:
		position = Vector2(925.0, 470.0)
		text = "BUY"

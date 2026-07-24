extends Label

@onready var countdown = $"../Countdown"
@onready var cash = $"../Money"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cash.money < countdown.money_upgrade_cost:
		text = "X"
	else:
		position = Vector2(163.0, 363.0)
		text = "BUY"

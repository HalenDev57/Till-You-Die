extends Label

@onready var countdown = $"../Countdown"
@onready var cash = $"../Money"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if cash.money < countdown.money_upgrade_cost:
		position = Vector2(184.0, 466.0)
		text = "X"
	else:
		position = Vector2(163.0, 466.0)
		text = "BUY"

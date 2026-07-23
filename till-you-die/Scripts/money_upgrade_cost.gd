extends Label

@onready var countdown = $"../Countdown"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "You need $3"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = "You need $" + str(countdown.money_upgrade_cost)

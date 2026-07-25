extends Label

var total_time := 0
var isreal = true
@onready var countdown = $"../Countdown"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = "Total Time: " + str(total_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isreal == true and countdown.time >= 1:
		isreal = false
		await get_tree().create_timer(1.0).timeout
		total_time += 1
		text = "Total Time: " + str(total_time)
		isreal = true

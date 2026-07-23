extends Label

@onready var clock_ticks = ($"../TickTock")
@onready var cash = $"../Money"

var time := 60
var isreal := true
var time_increase := 3
var money_upgrade := 1
var time_increase_cost := 2
var money_upgrade_cost := 2

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
		clock_ticks.play()
		isreal = true


func _on_texture_button_pressed() -> void:
	print("you clicked me!")
	if cash.money >= time_increase_cost:
		print("got enough money!")
		time += time_increase
		cash.money -= time_increase_cost
		print(cash.money)
		time_increase_cost += 2
		cash.text = "$" + str(cash.money)
		text = str(time)
		
		
		

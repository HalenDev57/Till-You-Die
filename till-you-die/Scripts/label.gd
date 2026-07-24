extends Label

@onready var clock_ticks = ($"../TickTock")
@onready var bomb = ($"../BOMB")
@onready var cash = $"../Money"

var time := 60
var isreal := true
var time_increase := 3
var needed_buys_till_increase := 0
var money_upgrade := 1
var time_increase_cost := 2
var money_upgrade_cost := 3
var money_upgrade_cost_increase := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text = str(time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if isreal == true and time >= 1:
		isreal = false
		var bomb_chance := randi_range(1, 26)
		print(bomb_chance)
		if bomb_chance == 21:
			time -= 15
			cash.money -= money_upgrade_cost_increase
			bomb.play()
		await get_tree().create_timer(1.0).timeout
		time -= 1
		text = str(time)
		clock_ticks.play()
		isreal = true


func _on_texture_button_pressed() -> void:
	if cash.money >= time_increase_cost and time <= 98 and time >0:
		time += time_increase
		if needed_buys_till_increase < 2:
			needed_buys_till_increase += 1
		else:
			needed_buys_till_increase = 0
			time_increase += 1
		if time >= 100:
			time = 99
		cash.money -= time_increase_cost
		time_increase_cost += 2
		cash.text = "$" + str(cash.money)
		text = str(time)


func _on_money_upgrade_button_pressed() -> void:
	if cash.money >= money_upgrade_cost and time > 0:
		cash.money += money_upgrade
		cash.money -= money_upgrade_cost
		#print(cash.money)
		money_upgrade_cost_increase += 3
		money_upgrade_cost += (2 + money_upgrade_cost_increase)
		cash.money_gained += 1
		cash.text = "$" + str(cash.money)

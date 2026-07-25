extends Label

@onready var clock_ticks = ($"../TickTock")
@onready var buy = ($"../Kaching")
@onready var x = ($"../X")
@onready var bomb = ($"../BOMB")
@onready var cash = $"../Money"
@onready var camera = $"../Camera2D"

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
		var bomb_chance := randi_range(1, 28)
		if bomb_chance == 21 and time > 25:
			time -= 15
			cash.money -= money_upgrade_cost_increase
			text = str(time)
			cash.text = "$" + str(cash.money)
			camera.trigger_shake()
			bomb.play()
		await get_tree().create_timer(1.0).timeout
		time -= 1
		text = str(time)
		clock_ticks.play()
		if time == 0:
			get_tree().change_scene_to_file("res://Scenes/The_Menu.tscn")
		isreal = true


func _on_texture_button_pressed() -> void:
	if cash.money >= time_increase_cost and time <= 98 and time >0:
		time += time_increase
		buy.play()
		if needed_buys_till_increase < 1:
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
	else:
		x.play()


func _on_money_upgrade_button_pressed() -> void:
	if cash.money >= money_upgrade_cost and time > 0:
		buy.play()
		cash.money += money_upgrade
		cash.money -= money_upgrade_cost
		#print(cash.money)
		money_upgrade_cost_increase += 3
		money_upgrade_cost += (2 + money_upgrade_cost_increase)
		cash.money_gained += 1
		cash.text = "$" + str(cash.money)
	else:
		x.play()

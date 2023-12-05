extends Node2D


var crusader = preload("res://scenes/Heroes/Crusader.tscn")
@onready var pos_1 = $Chamber_1/Heroes/pos_1
@onready var pos_2 = $Chamber_1/Heroes/pos_2
@onready var pos_3 = $Chamber_1/Heroes/pos_3
@onready var pos_4 = $Chamber_1/Heroes/pos_4

@onready var heros = [pos_1, pos_2, pos_3, pos_4]

@onready var enemy_1 = $Chamber_1/Enemies/pos_1/Enemy_1
@onready var enemy_2 = $Chamber_1/Enemies/pos_2/Enemy_2
@onready var enemy_3 = $Chamber_1/Enemies/pos_3/Enemy_3
@onready var enemy_4 = $Chamber_1/Enemies/pos_4/Enemy_4

@onready var enemies = [enemy_1, enemy_2, enemy_3, enemy_4]

@onready var combatants = [pos_1, pos_2, pos_3, pos_4,enemy_1, enemy_2, enemy_3, enemy_4 ]

var arr_of_heroes = []

var orders = []

func _ready():
	get_all_speeds()
	

func get_all_speeds(): 
	for combatant in combatants:
		var random_num = randi_range(1,8)
		var speed = combatant.get_child(0).SPEED + random_num
		orders.push_back(speed)
	
	print(orders)
	choose_next_combatant()
	
func choose_next_combatant():
	var max = orders.max()
	var index =orders.find(max)
	if index != -1:
		combatants[index].get_child(0).on_hero_hover()

extends Node2D


var crusader = preload("res://scenes/Heroes/Crusader.tscn")
@onready var pos_1 = $Chamber_1/Heroes/pos_1
@onready var pos_2 = $Chamber_1/Heroes/pos_2
@onready var pos_3 = $Chamber_1/Heroes/pos_3
@onready var pos_4 = $Chamber_1/Heroes/pos_4

@onready var heros = [pos_1.get_child(0), pos_2.get_child(0), pos_3.get_child(0), pos_4.get_child(0)]

@onready var enemy_1 = $Chamber_1/Enemies/pos_1/Enemy_1
@onready var enemy_2 = $Chamber_1/Enemies/pos_2/Enemy_2
@onready var enemy_3 = $Chamber_1/Enemies/pos_3/Enemy_3
@onready var enemy_4 = $Chamber_1/Enemies/pos_4/Enemy_4

@onready var enemies = [enemy_1, enemy_2, enemy_3, enemy_4]

@onready var combatants = [pos_1, pos_2, pos_3, pos_4,enemy_1, enemy_2, enemy_3, enemy_4 ]

var arr_of_heroes = []

var orders = []

var current_combatant_turn = null


func _ready():
	get_all_speeds()
	

func get_all_speeds(): 
	for combatant in combatants:
		var random_num = randi_range(1,8)
		var speed = combatant.get_child(0).SPEED + random_num
		orders.push_back(speed)
	
	choose_next_combatant()
	
func choose_next_combatant():
	var max = orders.max()
	var index =orders.find(max)
	if index != -1:
		#combatants[index].get_child(0).on_hero_hover()
		if current_combatant_turn:
			current_combatant_turn.on_hero_leave()
		current_combatant_turn= combatants[index].get_child(0) 
		orders[index] = -1
	else:
		print("did not find...")

	generate_combat_packet(current_combatant_turn)



func generate_combat_packet(attacker):
	
	CombatManager.initialize(attacker, heros, enemies)

func _input(event):
	if Input.is_action_just_pressed("ui_right"):
		choose_next_combatant()

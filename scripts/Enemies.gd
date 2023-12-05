extends Node2D

var index_to_target = null

@onready var enemy_1 = $pos_1/Enemy_1
@onready var enemy_2 = $pos_2/Enemy_2
@onready var enemy_3 = $pos_3/Enemy_3
@onready var enemy_4 = $pos_4/Enemy_4

var current_selected_enemy = null


func target_enemy(index):
	index_to_target = index
	
func untarget_enemy():
	index_to_target = null

func _input(event):
	if Input.is_action_just_pressed("click") and index_to_target != null:

		select_enemy(index_to_target)
			
		
func select_enemy(index):
	var enemy = null
	match(index):
		0:
			enemy= enemy_1.get_child(0)
		1:
			enemy= enemy_2.get_child(0)
		2:
			enemy= enemy_3.get_child(0)
		3:
			enemy= enemy_4.get_child(0)
	if current_selected_enemy != null:
		current_selected_enemy.on_hero_leave()
	current_selected_enemy = enemy
	enemy.on_hero_hover()

extends Node

class_name combat_packets


var attacker
var victim
var heroes
var enemies



func initialize(_attacker, _heroes, _enemies):
	attacker = _attacker
	heroes = _heroes
	enemies = _enemies
	if attacker.is_enemy:
		attacker.start_turn()
		var attack = choose_attack(attacker.rank)
		attacker.on_attack_choosen(attack)
		choose_victim(attack)
		victim.on_hero_hover()
		await get_tree().create_timer(2).timeout
		var dmg  = randi_range(attack.damage.x, attack.damage.y)
		attacker.attack(attack)
		victim.inflict_damage(dmg)

func choose_attack(rank):
	var available_attacks = []
	#cycle through our attacks, and choose which ones are available
	for attack in attacker.attacks:
		if attack.rank[rank-1] == 1:
			available_attacks.append(attack)
			
		
	
	
	return available_attacks[0]
	
func choose_victim(attack):
	print("attack name: ", attack.name)
	#this filters out the heros that are not in the target rank of the attack
	var new_hero_arr = heroes.filter(func(hero): return attack.target[hero.rank-1] != 0 )

	if attack.effect == EnemyAndAttackInformation.Effect_Types.STRESS:
		#choose victim with most stress
		var sress = -1
		for hero in new_hero_arr:
			if hero.STRESS > sress:
				victim = hero
				sress = hero.STRESS
		
			
	else:
		#choose victim with lowest hp
		var hp = 100000
		for hero in new_hero_arr:
			if hero.HP < hp:
				victim = hero
				hp = hero.HP
	return victim
	
	for hero in heroes:
		print(hero.HP)

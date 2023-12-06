extends Node

@export var HP : int
@export var ACC_MOD : int
@export var CRIT : int
@export var DMG : Vector2i
@export var DODGE : float
@export var PROT : int
@export var SPEED: int
@export var STRESS : int = 0

@export var rank : int

@export var attacks : Array[attack_types] 

@export var image : Texture

@onready var texture_rect = $Control/VBoxContainer/TextureRect

@export var is_enemy : bool = true
@onready var turn_sound = $turn_sound
@onready var move_sound = $move_sound
@onready var attack_name = $attack_name

@onready var dmg_label = $dmg_label
@onready var attack_sound = $attack_sound

@onready var animation_player = $AnimationPlayer
@onready var combatant_sprite_animations = $"Bone-courtier/AnimationPlayer"

func start_turn():
	dmg_label.hide()
	turn_sound.play()
	on_hero_hover()
	
func on_attack_choosen(attack : attack_types):
	attack_name.text = attack.name
	move_sound.play()

func attack(attack: attack_types):
	combatant_sprite_animations.play("dagger")
	attack_sound.play()
	await get_tree().create_timer(1.5).timeout
	combatant_sprite_animations.play("idle")

func inflict_damage(dmg):
	dmg_label.text = str(dmg)
	animation_player.play("hurt")
	

func on_hero_hover():
	texture_rect.modulate = Color(255,255,255,255)

func on_hero_leave():
	texture_rect.modulate = Color(255,255,255,0)


	

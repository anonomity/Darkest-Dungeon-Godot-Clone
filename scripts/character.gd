extends Node

@export var HP : int
@export var ACC_MOD : int
@export var CRIT : int
@export var DMG : Vector2i
@export var DODGE : float
@export var PROT : int
@export var SPEED: int

@export var attacks : Array[attack_types] 

@export var image : Texture

@onready var texture_rect = $Control/VBoxContainer/TextureRect



func on_hero_hover():
	texture_rect.modulate = Color(255,255,255,255)

func on_hero_leave():
	texture_rect.modulate = Color(255,255,255,0)

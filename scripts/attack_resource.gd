extends Resource

class_name attack_types

enum Range_Type {Melee, Ranged}
enum Enemy_Type {UNHOLY, HUMAN, BEAST, STONEWORK, ELDRITCH, BLOODSUCKER, HUSK, OTHER, NONE}

@export var name : String = ""
@export var texture : Texture

@export var range : Range_Type = Range_Type.Melee
@export var rank : Vector4 = Vector4.ZERO
@export var target : Vector4 = Vector4.ZERO

@export var damage : int = 0
@export var accuracy : int = 0
@export var crit_mod : int = 0
@export var effect_vs : Enemy_Type = Enemy_Type.NONE
@export var effect_dmg : int = 0


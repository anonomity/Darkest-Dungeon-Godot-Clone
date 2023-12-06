extends Resource

class_name attack_types


@export var name : String = ""
@export var texture : Texture

@export var range : EnemyAndAttackInformation.Range_Type = EnemyAndAttackInformation.Range_Type.Melee
@export var rank : Array[int]
@export var target : Array[int]

@export var damage : Vector2i = Vector2.ZERO
@export var accuracy : int = 0
@export var crit_mod : int = 0
@export var effect_vs : EnemyAndAttackInformation.Enemy_Type = EnemyAndAttackInformation.Enemy_Type.NONE
@export var effect_dmg : int = 0

@export var effect : EnemyAndAttackInformation.Effect_Types  = EnemyAndAttackInformation.Effect_Types.NONE

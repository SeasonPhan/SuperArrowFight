#> asset:mob/ally.golem/tick/apply_damage
#
# マクロ関数: ゴーレム復帰時の差分ダメージを適用する
# 全回復後にダメージを与えて目標HPに設定する
# @s = プレイヤー
#
# @within function asset:mob/ally.golem/tick/apply_restore_hp

$damage @s $(DamageAmount) minecraft:magic

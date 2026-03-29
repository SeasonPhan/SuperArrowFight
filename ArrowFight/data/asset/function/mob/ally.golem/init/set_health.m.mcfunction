#> asset:mob/ally.golem/init/set_health.m
#
# 体力をフィールド値に合わせて設定する
#
# @within function asset:mob/ally.golem/init/

$execute unless data storage asset:context this.MaxHealth run data modify storage asset:context this.MaxHealth set value 100
$attribute @s minecraft:generic.max_health base set $(MaxHealth)
$data modify entity @s Health set value $(MaxHealth)f

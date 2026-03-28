#> asset:object/abstract.gravity_projectile/tick/
#
# Objectのtick時の処理
#
# @within asset_manager:object/tick/tick.m

# [DEBUG] Confirm abstract.gravity_projectile/tick/ is running
    execute if predicate lib:is_vehicle run tellraw @a {"text":"[AbsGravProj DEBUG] tick: @s HAS vehicle (in flight).","color":"dark_aqua"}
    execute unless predicate lib:is_vehicle run tellraw @a {"text":"[AbsGravProj DEBUG] tick: @s has NO vehicle → calling call.m {method:hit}","color":"red"}

# 自身が何にも乗っていなければ、hitメソッドを発動する
    execute unless predicate lib:is_vehicle at @s run function asset:object/call.m {method:hit}

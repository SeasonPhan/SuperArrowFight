#> asset:object/projectile.golem_bullet/tick/
#
# Objectのtick時の処理
#
# @within asset_manager:object/tick/tick.m

# パーティクル
    particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.05 3 force @a[distance=..32]
    particle dust{color:[0.8,0.8,0.8],scale:1} ~ ~ ~ 0.1 0.1 0.1 1 2 force @a[distance=..32]

# [DEBUG] Periodic "tick is running" ping every 20 ticks while vehicle (ender pearl) is alive
    execute if predicate lib:is_vehicle run scoreboard players add @s GolemBullet.DbgTick 1
    execute if predicate lib:is_vehicle if score @s GolemBullet.DbgTick matches 20 run tellraw @a {"text":"[GolemBullet DEBUG] TICK: projectile in-flight (ender pearl alive).","color":"aqua"}
    execute if predicate lib:is_vehicle if score @s GolemBullet.DbgTick matches 20 run scoreboard players reset @s GolemBullet.DbgTick
# [DEBUG] Alert when ender pearl is gone — hit() should fire immediately after this
    execute unless predicate lib:is_vehicle run tellraw @a {"text":"[GolemBullet DEBUG] TICK: ender pearl GONE, hit() should fire!","color":"red"}

# Super
    function asset:object/super.tick

#> asset:object/projectile.golem_bullet/tick/
#
# Objectのtick時の処理
#
# @within asset_manager:object/tick/tick.m

# パーティクル
    particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0.05 3 force @a[distance=..32]
    particle dust{color:[0.8,0.8,0.8],scale:1} ~ ~ ~ 0.1 0.1 0.1 1 2 force @a[distance=..32]

# Super
    function asset:object/super.tick

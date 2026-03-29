#> asset:object/projectile.golem_bullet/tick/
#
# Objectのtick時の処理
#
# @within asset_manager:object/tick/tick.m

# パーティクル (iron/white particles)
    particle entity_effect{color:[0.8,0.8,0.8,1.00]} ~ ~ ~ 0.1 0.1 0.1 1 1 force @a[distance=..64]
    particle dust{color:[0.7,0.7,0.7],scale:1} ~ ~ ~ 0.1 0.1 0.1 0 2 force @a[distance=..64]

# Super
    function asset:object/super.tick

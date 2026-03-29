#> asset:object/projectile.golem_arrow/tick/
#
# Objectのtick時の処理
#
# @within asset_manager:object/tick/tick.m

# パーティクル
    particle dust{color:[0.7,0.7,0.7],scale:1} ~ ~ ~ 0.1 0.1 0.1 1 2 force @a[distance=..64]
    particle dust{color:[0.9,0.9,0.9],scale:0.5} ~ ~ ~ 0 0 0 1 1 force @a[distance=..64]

# Super
    function asset:object/super.tick

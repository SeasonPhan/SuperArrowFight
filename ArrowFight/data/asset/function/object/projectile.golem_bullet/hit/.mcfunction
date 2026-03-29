#> asset:object/projectile.golem_bullet/hit/
#
# 着弾時の処理 - プレイヤー直撃または地面着弾でゴーレム化
#
# @within asset_manager:object/call_method/run_method.m

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit!","color":"gold"}]

# 3ブロック以内の最も近いプレイヤーをゴーレム化 (チーム問わず、自分自身含む)
    execute as @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..3] at @s run function asset:object/projectile.golem_bullet/hit/transform_player

# 演出
    playsound minecraft:entity.iron_golem.hurt neutral @a ~ ~ ~ 1.5 1
    playsound minecraft:block.anvil.land neutral @a ~ ~ ~ 1.0 0.8
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle minecraft:electric_spark ~ ~1 ~ 0 0 0 1 50 force @a[distance=..64]

# Super
    function asset:object/super.method

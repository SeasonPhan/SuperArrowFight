#> asset:object/projectile.golem_bullet/hit/
#
# 着弾時の処理 - プレイヤー直撃または地面着弾でゴーレム化
#
# @within asset_manager:object/call_method/run_method.m

# デバッグ: マーカーの位置を表示
    execute store result score $HitPosX Temporary run data get entity @s Pos[0] 1
    execute store result score $HitPosY Temporary run data get entity @s Pos[1] 1
    execute store result score $HitPosZ Temporary run data get entity @s Pos[2] 1
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit! Marker pos: ","color":"gold"},{"score":{"name":"$HitPosX","objective":"Temporary"}},{"text":", ","color":"gold"},{"score":{"name":"$HitPosY","objective":"Temporary"}},{"text":", ","color":"gold"},{"score":{"name":"$HitPosZ","objective":"Temporary"}}]

# 5ブロック以内の最も近いプレイヤーをゴーレム化 (チーム問わず、自分自身含む)
    execute as @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..4] at @s run function asset:object/projectile.golem_bullet/hit/transform_player

# デバッグ: 対象が見つからなかった場合 - 詳細情報を表示
    #execute unless entity @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..5] run tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"No valid player found within 5 blocks!","color":"red"}]
    #execute unless entity @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..5] as @a[distance=..32] run tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"  Nearby: ","color":"red"},{"selector":"@s"},{"text":" GameJoined=","color":"red"},{"nbt":"Tags","entity":"@s"}]

# 演出
    playsound minecraft:entity.iron_golem.hurt neutral @a ~ ~ ~ 1.5 1
    playsound minecraft:block.anvil.land neutral @a ~ ~ ~ 1.0 0.8
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle minecraft:electric_spark ~ ~1 ~ 0 0 0 1 50 force @a[distance=..64]

# Super
    function asset:object/super.method

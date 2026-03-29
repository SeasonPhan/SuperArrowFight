#> asset:object/projectile.golem_bullet/hit/hit_ground
#
# 地面着弾時の処理 - 最も近いプレイヤーをスキャンしてゴーレム化
#
# @within function asset:object/projectile.golem_bullet/hit/

# 5ブロック以内の最も近いプレイヤーをゴーレム化 (チーム問わず)
    execute as @p[tag=GameJoinedPlayer,tag=!PlayerShouldInvulnerable,distance=..4] at @s run function asset:object/projectile.golem_bullet/hit/transform_player

# デバッグ
    #execute if entity @p[tag=GameJoinedPlayer,tag=!PlayerShouldInvulnerable,distance=..5] run tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit ground - found nearby player!","color":"yellow"}]
    #execute unless entity @p[tag=GameJoinedPlayer,tag=!PlayerShouldInvulnerable,distance=..5] run tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit ground - no player nearby","color":"red"}]

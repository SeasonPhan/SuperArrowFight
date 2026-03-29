#> asset:object/projectile.golem_bullet/hit/hit_player
#
# プレイヤーに直撃した場合のゴーレム化処理
#
# @within function asset:object/projectile.golem_bullet/hit/

# ヒットフラグを立てる
    data modify storage asset:context GolemBulletHitPlayer set value true

# 最も近いプレイヤーをゴーレム化する
    execute positioned ~-0.5 ~-0.5 ~-0.5 as @p[tag=!PlayerShouldInvulnerable,tag=GameJoinedPlayer,dx=0] at @s run function asset:object/projectile.golem_bullet/hit/transform_player

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit player directly!","color":"yellow"}]

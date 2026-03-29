#> asset:object/projectile.golem_bullet/hit/
#
# 着弾時の処理 - プレイヤー直撃または地面着弾でゴーレム化
#
# @within asset_manager:object/call_method/run_method.m

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet hit!","color":"gold"}]

# プレイヤー直撃チェック (1ブロック範囲内の最も近いプレイヤー、無敵でないもの)
    execute positioned ~-0.5 ~-0.5 ~-0.5 if entity @p[tag=!PlayerShouldInvulnerable,tag=GameJoinedPlayer,dx=0] run function asset:object/projectile.golem_bullet/hit/hit_player

# プレイヤーに当たらなかった場合は地面着弾 - 近くのプレイヤーをスキャン
    execute unless data storage asset:context {GolemBulletHitPlayer:true} run function asset:object/projectile.golem_bullet/hit/hit_ground

# リセット
    data remove storage asset:context GolemBulletHitPlayer

# 演出
    playsound minecraft:entity.iron_golem.hurt neutral @a ~ ~ ~ 1.5 1
    playsound minecraft:block.anvil.land neutral @a ~ ~ ~ 1.0 0.8
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle minecraft:electric_spark ~ ~1 ~ 0 0 0 1 50 force @a[distance=..64]

# Super
    function asset:object/super.method

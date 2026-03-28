#> asset:object/projectile.golem_bullet/init/
#
# Objectのinit時の処理
#
# @within asset_manager:object/init/init.m

# [DEBUG] Confirm init ran — if this shows, the AssetObject marker was created
    tellraw @a {"text":"[GolemBullet DEBUG] INIT fired! Marker entity exists.","color":"gold"}
    execute on vehicle run tellraw @a {"text":"[GolemBullet DEBUG] INIT: ender pearl vehicle is present.","color":"gold"}
    execute unless on vehicle run tellraw @a {"text":"[GolemBullet DEBUG] INIT ERROR: no ender pearl vehicle!","color":"red"}

# サウンド
    playsound minecraft:entity.iron_golem.attack player @a ^ ^ ^1 1 1.2
    playsound minecraft:entity.blaze.shoot player @a ^ ^ ^1 1 1.5

# 下の雪玉に場外で消す用のタグを付与
    execute on vehicle run tag @s add VanishOnExitArena

# Super
    function asset:object/super.init

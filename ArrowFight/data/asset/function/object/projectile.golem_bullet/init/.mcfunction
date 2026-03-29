#> asset:object/projectile.golem_bullet/init/
#
# Objectのinit時の処理
#
# @within asset_manager:object/init/init.m

# サウンド
    playsound minecraft:entity.iron_golem.repair player @a ^ ^ ^1 1 1.5
    playsound minecraft:block.anvil.place player @a ^ ^ ^1 0.5 1

# 下の雪玉に場外で消す用のタグを付与
    execute on vehicle run tag @s add VanishOnExitArena

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem Bullet fired!","color":"gold"}]

# Super
    function asset:object/super.init

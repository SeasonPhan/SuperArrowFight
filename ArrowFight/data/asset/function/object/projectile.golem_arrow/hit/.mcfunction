#> asset:object/projectile.golem_arrow/hit/
#
# 継承先などから実行される処理
#
# @within asset_manager:object/call_method/run_method.m

# 近くのプレイヤーを検索（タグで除外しない生存中のプレイヤー）
    tag @a[distance=..5,gamemode=!spectator,limit=1,sort=nearest] add GolemTarget

# ターゲットがいればゴーレム化を実行
    execute if entity @a[tag=GolemTarget,distance=..5,limit=1] as @a[tag=GolemTarget,distance=..5,limit=1] at @s run function asset:object/projectile.golem_arrow/hit/transform

# タグ削除
    tag @a[tag=GolemTarget] remove GolemTarget

# 演出
    playsound minecraft:block.anvil.land neutral @a ~ ~ ~ 1.5 1
    playsound minecraft:entity.iron_golem.hurt player @a ~ ~ ~ 1 1
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle minecraft:electric_spark ~ ~1 ~ 0 0 0 1 50 force @a[distance=..64]
    particle dust{color:[0.7,0.7,0.7],scale:2} ~ ~1 ~ 0.5 0.5 0.5 1 30 force @a[distance=..64]

# Super
    function asset:object/super.method

#> asset:mob/ally.golem/summon/
#
# Mob召喚処理の呼び出し時の処理のエイリアス
#
# @within asset_manager:mob/summon/summon.m

# 元となるEntityを召喚する
    summon iron_golem ~ ~ ~ {Tags:["MobInit","VanishOnReset","VanishOnExitArena","GolemProxy"],NoLootTable:1b,Attributes:[{Name:"minecraft:knockback_resistance",Base:1.0}]}

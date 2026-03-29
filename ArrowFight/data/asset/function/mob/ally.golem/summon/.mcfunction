#> asset:mob/ally.golem/summon/
#
# Mob召喚処理の呼び出し時の処理のエイリアス
#
# @within asset_manager:mob/summon/summon.m

# 元となるEntityを召喚する
    summon iron_golem ~ ~ ~ {Tags:["MobInit","VanishOnReset"],PlayerCreated:0b}

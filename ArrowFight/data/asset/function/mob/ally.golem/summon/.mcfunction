#> asset:mob/ally.golem/summon/
#
# Mob召喚処理
#
# @within asset_manager:mob/summon/summon.m

# 元となるEntityを召喚する (husk - 少し大きめ)
    summon husk ~ ~ ~ {Tags:["MobInit","VanishOnReset"],drop_chances:{head:0.000,mainhand:0.000},PersistenceRequired:1b,IsBaby:0b}

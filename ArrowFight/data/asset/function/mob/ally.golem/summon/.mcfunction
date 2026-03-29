#> asset:mob/ally.golem/summon/
#
# Mob召喚処理
#
# @within asset_manager:mob/summon/summon.m

# 元となるEntityを召喚する (vanilla iron golem health = 100)
    summon iron_golem ~ ~ ~ {Tags:["MobInit","VanishOnReset"],drop_chances:{head:0.000,mainhand:0.000},PersistenceRequired:1b}

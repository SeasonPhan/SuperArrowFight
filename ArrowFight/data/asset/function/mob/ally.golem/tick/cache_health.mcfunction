#> asset:mob/ally.golem/tick/cache_health
#
# 体力割合のキャッシュを保持する
#
# @within function asset:mob/ally.golem/tick/

# 既定値
    execute unless data storage asset:context this.HealthPercent run data modify storage asset:context this.HealthPercent set value 100
    execute unless data storage asset:context this.LastHealthPercent run data modify storage asset:context this.LastHealthPercent set value 100

# 直前の体力を保存
    data modify storage asset:context this.LastHealthPercent set from storage asset:context this.HealthPercent

# 現在体力の割合を計算
    execute store result score $Health Temporary run data get entity @s Health
    execute store result score $MaxHealth Temporary run attribute @s max_health get
    scoreboard players operation $Health Temporary *= $100 Const
    scoreboard players operation $Health Temporary /= $MaxHealth Temporary
    execute store result storage asset:context this.HealthPercent int 1 run scoreboard players get $Health Temporary

# リセット
    scoreboard players reset $Health Temporary
    scoreboard players reset $MaxHealth Temporary

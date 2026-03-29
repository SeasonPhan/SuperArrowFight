#> asset:mob/ally.golem/restore/return_player
#
# 観戦にされたプレイヤーを戻す
#
# @within function asset:mob/ally.golem/restore/do

# 元のモードへ
    gamemode adventure @s
    tp @s ~ ~ ~
    tag @s remove GolemVictim

# 体力を割合で反映
    execute store result score $Percent Temporary run data get storage asset:context this.HealthPercent
    execute if score $Percent Temporary matches ..0 run scoreboard players set $Percent Temporary 1
    execute store result score $PlayerMax Temporary run attribute @s max_health get
    scoreboard players operation $PlayerMax Temporary *= $Percent Temporary
    scoreboard players operation $PlayerMax Temporary /= $100 Const
    execute if score $PlayerMax Temporary matches ..0 run scoreboard players set $PlayerMax Temporary 1
    execute store result entity @s Health float 0.01 run scoreboard players get $PlayerMax Temporary

# リセット
    scoreboard players reset $Percent Temporary
    scoreboard players reset $PlayerMax Temporary

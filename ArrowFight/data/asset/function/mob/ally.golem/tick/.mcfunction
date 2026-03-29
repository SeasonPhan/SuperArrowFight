#> asset:mob/ally.golem/tick/
#
# Mobのtick時の処理
#
# @within asset_manager:mob/triggers/tick/tick.m

# 体力キャッシュを更新
    function asset:mob/ally.golem/tick/cache_health

# 時間経過で元に戻す
    scoreboard players add @s General.Mob.Tick 1
    execute store result score $Duration Temporary run data get storage asset:context this.DurationTicks
    execute if score $Duration Temporary matches ..0 run scoreboard players set $Duration Temporary 160
    execute unless data storage asset:context this{Restored:true} if score @s General.Mob.Tick >= $Duration Temporary run function asset:mob/ally.golem/restore/timeout
    scoreboard players reset $Duration Temporary

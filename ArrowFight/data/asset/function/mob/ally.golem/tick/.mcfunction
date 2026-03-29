#> asset:mob/ally.golem/tick/
#
# Golemのtick処理 - タイマー、体力監視、変身解除
#
# @within asset_manager:mob/triggers/tick/tick.m

# 猶予期間中はスキップ
    execute if score @s ally.golem.GraceTicks matches 1.. run scoreboard players remove @s ally.golem.GraceTicks 1
    execute if score @s ally.golem.GraceTicks matches 1.. run return fail

# タイマー減少
    scoreboard players remove @s ally.golem.Timer 1

# 攻撃対象の更新 (20tickごとに最寄りのプレイヤーに切り替え)
    scoreboard players operation $Temp Temporary = @s ally.golem.Timer
    scoreboard players operation $Temp Temporary %= $10 Const
    execute if score $Temp Temporary matches 0 run data modify entity @s AngerTime set value 999999
    execute if score $Temp Temporary matches 0 as @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..32] run data modify entity @e[type=iron_golem,tag=this,limit=1] AngryAt set from entity @s UUID

# プレイヤーチェック (ゴーレムの状態を毎tick確認)
    function asset:mob/ally.golem/tick/player_check

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

# プレイヤーチェック (ゴーレムの状態を毎tick確認)
    function asset:mob/ally.golem/tick/player_check

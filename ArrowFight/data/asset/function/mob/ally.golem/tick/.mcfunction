#> asset:mob/ally.golem/tick/
#
# Mobのtick時の処理
#
# @within asset_manager:mob/triggers/tick/tick.m

# タイマーを減らす
    scoreboard players remove @s GolemTimer 1

# 現在の体力を取得して保存
    function api:mob/get_health
    execute store result score @s GolemLastHealth run data get storage api: Return.Health 100

# 体力パーセンテージを取得
    function api:mob/get_health_percent
    execute store result score $HealthPercent Temporary run data get storage api: Return.HealthPer 1

# 体力が40%以下になったか、8秒経過したか確認
    execute if score $HealthPercent Temporary matches ..40 run function asset:mob/ally.golem/tick/restore_player
    execute if score @s GolemTimer matches ..0 run function asset:mob/ally.golem/tick/restore_player

# クリーンアップ
    scoreboard players reset $HealthPercent Temporary

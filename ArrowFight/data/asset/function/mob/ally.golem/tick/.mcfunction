#> asset:mob/ally.golem/tick/
#
# Mobのtick時の処理
#
# @within asset_manager:mob/triggers/tick/tick.m

# Tick カウンターを加算
    scoreboard players add @s General.Mob.Tick 1

# ゴーレムの現在座標を被害者プレイヤーに毎tick記録する (緊急復元時のテレポート先)
    scoreboard players operation $GolemPosLink Temporary = @s ally.golem.VictimLink
    execute store result score $GolemPosX Temporary run data get entity @s Pos[0] 1
    execute store result score $GolemPosY Temporary run data get entity @s Pos[1] 1
    execute store result score $GolemPosZ Temporary run data get entity @s Pos[2] 1
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemPosLink Temporary run scoreboard players operation @s ally.golem.PosX = $GolemPosX Temporary
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemPosLink Temporary run scoreboard players operation @s ally.golem.PosY = $GolemPosY Temporary
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemPosLink Temporary run scoreboard players operation @s ally.golem.PosZ = $GolemPosZ Temporary
    scoreboard players reset $GolemPosLink Temporary
    scoreboard players reset $GolemPosX Temporary
    scoreboard players reset $GolemPosY Temporary
    scoreboard players reset $GolemPosZ Temporary

# 現在の体力を取得 (整数、小数点以下切り捨て)
    execute store result score $GolemHealthNow Temporary run data get entity @s Health

# 8秒経過 (160 ticks) で元に戻す
    execute if score @s General.Mob.Tick matches 160.. run function asset:mob/ally.golem/tick/revert
    execute if score @s General.Mob.Tick matches 160.. run return 0

# 体力が最大の 40% 以下になったら元に戻す
# (0.4 = 40% の閾値: max_health に 0.4 をかけた整数値と現在体力を比較する)
    execute store result score $GolemThreshold Temporary run attribute @s max_health get 0.4
    execute if score $GolemHealthNow Temporary <= $GolemThreshold Temporary run function asset:mob/ally.golem/tick/revert
    execute if score $GolemHealthNow Temporary <= $GolemThreshold Temporary run return 0

# クリーンアップ
    scoreboard players reset $GolemHealthNow Temporary
    scoreboard players reset $GolemThreshold Temporary

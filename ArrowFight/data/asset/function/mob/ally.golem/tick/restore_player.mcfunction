#> asset:mob/ally.golem/tick/restore_player

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Restoring player from golem (normal), VictimLink=","color":"green"},{"score":{"name":"@s","objective":"ally.golem.VictimLink"}}]

# ゴーレムのVictimLinkを一時変数に保存 (@sはゴーレム)
    scoreboard players operation $GolemVictimLink Temporary = @s ally.golem.VictimLink

# ゴーレムの位置を記録
    execute store result score $GolemPosX Temporary run data get entity @s Pos[0] 1000
    execute store result score $GolemPosY Temporary run data get entity @s Pos[1] 1000
    execute store result score $GolemPosZ Temporary run data get entity @s Pos[2] 1000

# 現在のゴーレム体力パーセントを計算 (scale=10000倍で精度確保)
    execute store result score $GolemHealth Temporary run data get entity @s Health 100
    execute store result score $GolemMaxHealth Temporary run attribute @s max_health get 100

    scoreboard players set $Scale Temporary 10000
    scoreboard players operation $GolemHealthPer Temporary = $GolemHealth Temporary
    scoreboard players operation $GolemHealthPer Temporary *= $Scale Temporary
    scoreboard players operation $GolemHealthPer Temporary /= $GolemMaxHealth Temporary

# ゴーレム体力パーセントをプレイヤーのスコアに直接保存 (Temporaryの共有状態に依存しないため)
    execute as @a[tag=GolemTransformed] if score @s UserID = $GolemVictimLink Temporary run scoreboard players operation @s ally.golem.RestoreHP = $GolemHealthPer Temporary

# VictimLinkと一致するプレイヤーを探して復帰させる (ゴーレムの位置で実行)
    execute at @s as @a[tag=GolemTransformed] if score @s UserID = $GolemVictimLink Temporary run function asset:mob/ally.golem/tick/do_restore

# ゴーレムを消す
    particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1 1
    kill @s

#> asset:mob/ally.golem/tick/restore_player
#
# ゴーレムから通常プレイヤーに戻す処理 (通常の変身解除)
# ゴーレムの体力割合をプレイヤーに反映する
#
# @within function asset:mob/ally.golem/tick/player_check

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Restoring player from golem (normal), VictimLink=","color":"green"},{"score":{"name":"@s","objective":"ally.golem.VictimLink"}}]

#> 計算用スコアホルダー
# @private
    #declare score_holder $GolemHealth
    #declare score_holder $GolemMaxHealth
    #declare score_holder $GolemVictimLink

# ゴーレムのVictimLinkを一時変数に保存 (@sはゴーレム)
    scoreboard players operation $GolemVictimLink Temporary = @s ally.golem.VictimLink

# ゴーレムの位置を記録
    execute store result score $GolemPosX Temporary run data get entity @s Pos[0] 1000
    execute store result score $GolemPosY Temporary run data get entity @s Pos[1] 1000
    execute store result score $GolemPosZ Temporary run data get entity @s Pos[2] 1000

# 現在のゴーレム体力パーセントを計算 (scale=100でオーバーフロー防止)
    execute store result score $GolemHealth Temporary run data get entity @s Health 100
    execute store result score $GolemMaxHealth Temporary run attribute @s max_health get 100

# プレイヤーの最大体力(プレイヤー固有) × (ゴーレム体力 / ゴーレム最大体力) = 復帰体力
# プレイヤーのmax_healthはプレイヤー実体として実行するdo_restore内で取得・計算する

# VictimLinkと一致するプレイヤーを探して復帰させる (ゴーレムの位置で実行)
    execute at @s as @a[tag=GolemTransformed] if score @s UserID = $GolemVictimLink Temporary run function asset:mob/ally.golem/tick/do_restore

# ゴーレムを消す
    particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1 1
    kill @s

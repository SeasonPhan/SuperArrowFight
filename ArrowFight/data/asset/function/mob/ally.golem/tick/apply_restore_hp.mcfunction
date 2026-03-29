#> asset:mob/ally.golem/tick/apply_restore_hp
#
# ゴーレム復帰時の体力を次tickで適用する
# gamemode spectator → survival の切り替え時にHPがリセットされるため、1tick遅延させる
# @s = 復帰対象のプレイヤー
#
# @within function core:tick/player/

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applying restore HP to ","color":"yellow"},{"selector":"@s"},{"text":", RestoreHP=","color":"yellow"},{"score":{"name":"@s","objective":"ally.golem.RestoreHP"}}]

# 体力を設定 (2000 = 20HP × 100倍, 0.01で元のHP単位に戻す)
    execute store result entity @s Health float 0.01 run scoreboard players get @s ally.golem.RestoreHP

# 最低1HPは保証する
    execute store result score $Temp Temporary run data get entity @s Health 100
    execute if score $Temp Temporary matches ..0 run data modify entity @s Health set value 1.0f

# デバッグ (適用後のHP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applied HP: ","color":"yellow"},{"score":{"name":"$Temp","objective":"Temporary"}},{"text":"/2000","color":"yellow"}]

# タグとスコアをリセット
    tag @s remove GolemRestoreHP
    scoreboard players reset @s ally.golem.RestoreHP

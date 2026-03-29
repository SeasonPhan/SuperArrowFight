#> asset:mob/ally.golem/tick/apply_restore_hp
#
# ゴーレム復帰時の体力を適用する
# プレイヤーのHealth NBTは直接書き込みできないため、
# max_healthを一時的に下げてHPをクランプし、元に戻す方式を使用
# @s = 復帰対象のプレイヤー
#
# @within function core:tick/player/

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applying restore HP to ","color":"yellow"},{"selector":"@s"},{"text":", RestoreHP=","color":"yellow"},{"score":{"name":"@s","objective":"ally.golem.RestoreHP"}}]

# 最低1HP(=100スケール)は保証する
    execute if score @s ally.golem.RestoreHP matches ..100 run scoreboard players set @s ally.golem.RestoreHP 100

# RestoreHP(スケール100)をfloat化してストレージに保存 (例: 225 → 2.25)
    execute store result storage asset:temp RestoreHP float 0.01 run scoreboard players get @s ally.golem.RestoreHP

# max_healthを復帰HPに一時的に設定 → 現在HPがクランプされる (20.0 → 2.25 etc.)
    function asset:mob/ally.golem/tick/apply_max_health with storage asset:temp

# max_healthを元に戻す (HPはクランプされた値のまま残る)
    attribute @s max_health base set 20

# デバッグ (適用後のHP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applied HP: ","color":"yellow"},{"score":{"name":"$Temp","objective":"Temporary"}},{"text":"/2000","color":"yellow"}]

# タグとスコアをリセット
    tag @s remove GolemRestoreHP
    scoreboard players reset @s ally.golem.RestoreHP

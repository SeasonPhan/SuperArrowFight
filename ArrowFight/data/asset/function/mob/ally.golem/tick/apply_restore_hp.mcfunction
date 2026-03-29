#> asset:mob/ally.golem/tick/apply_restore_hp
#
# ゴーレム復帰時の体力適用 (Stage 1/2)
# max_healthを目標HPに設定し、instant_healthで回復する
# 次tickで finalize_restore_hp が max_health を復元する
#
# @within function core:tick/player/

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applying restore HP to ","color":"yellow"},{"selector":"@s"},{"text":", RestoreHP=","color":"yellow"},{"score":{"name":"@s","objective":"ally.golem.RestoreHP"}}]

# プレイヤーの実際の最大体力を取得 (scale 100)
    execute store result score $PlayerMaxHealth Temporary run attribute @s max_health get 100

# 最低1HP(=100スケール)は保証する
    execute if score @s ally.golem.RestoreHP matches ..100 run scoreboard players set @s ally.golem.RestoreHP 100

# 目標体力が実際の最大体力を超えないようにクランプする
    scoreboard players operation @s ally.golem.RestoreHP < $PlayerMaxHealth Temporary

# RestoreHPをfloatに変換してストレージに保存 (scale 0.01: 1800 → 18.0)
    execute store result storage asset:temp RestoreHP float 0.01 run scoreboard players get @s ally.golem.RestoreHP

# max_healthを目標HPに設定 (現在HPが目標より高い場合はクランプされる)
    function asset:mob/ally.golem/tick/apply_max_health with storage asset:temp

# instant_healthで目標HPまで回復 (現在HPが目標より低い場合)
# amplifier 10 = 2048HP分の回復だが、max_healthが目標HPに設定済みなので目標HP以上には回復しない
# ※ここではclearしない。次tickで回復が処理された後にclearする
    effect give @s minecraft:instant_health 1 10 true

# デバッグ (適用後のHP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applied HP: ","color":"yellow"},{"score":{"name":"$Temp","objective":"Temporary"}},{"text":"/","color":"yellow"},{"score":{"name":"$PlayerMaxHealth","objective":"Temporary"}}]

# GolemRestoreHP_Finalize タグに切り替え (次tickでmax_healthを復元するため)
    tag @s remove GolemRestoreHP
    tag @s add GolemRestoreHP_Finalize

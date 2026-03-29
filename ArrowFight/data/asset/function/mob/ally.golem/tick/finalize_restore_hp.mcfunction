#> asset:mob/ally.golem/tick/finalize_restore_hp
#
# ゴーレム復帰時の体力適用 (Stage 2/2)
# instant_healthを除去してmax_healthを元に戻す
#
# @within function core:tick/player/

# instant_healthを除去 (継続回復を防止)
    effect clear @s minecraft:instant_health

# max_healthを元に戻す (20 = プレイヤーの本来の最大体力)
    attribute @s max_health base set 20

# デバッグ (最終HP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Finalized HP: ","color":"green"},{"score":{"name":"$Temp","objective":"Temporary"}},{"text":"/2000","color":"green"}]

# タグとスコアをリセット
    tag @s remove GolemRestoreHP_Finalize
    scoreboard players reset @s ally.golem.RestoreHP

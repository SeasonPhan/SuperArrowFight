#> asset:mob/ally.golem/tick/emergency_restore
#
# ゴーレムが即死した場合の処理 - プレイヤーを戻してkillする
# (例: 50%から一撃で0%になった場合)
#
# @within function asset:mob/ally.golem/tick/player_check

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem killed! Emergency restore - player will die","color":"red"}]

#> 計算用スコアホルダー
# @private
    #declare score_holder $GolemVictimLink

# ゴーレムのVictimLinkを一時変数に保存
    scoreboard players operation $GolemVictimLink Temporary = @s ally.golem.VictimLink

# VictimLinkと一致するプレイヤーを探して復帰させてからkillする (ゴーレムの位置で実行)
    execute at @s as @a[tag=GolemTransformed] if score @s UserID = $GolemVictimLink Temporary run function asset:mob/ally.golem/tick/do_emergency_restore

# ゴーレムを消す
    particle minecraft:poof ~ ~1 ~ 0.5 0.5 0.5 0.1 20 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1 0.5
    kill @s

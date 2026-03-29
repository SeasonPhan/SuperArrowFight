#> asset:mob/ally.golem/restore/do
#
# プレイヤーを元の場所に戻す
#
# @within function asset:mob/ally.golem/restore/*

# 戻す対象を探して処理
    execute store result score $Victim Temporary run data get storage asset:context this.VictimUserID
    execute at @s as @a[distance=..150] if score @s UserID = $Victim Temporary run function asset:mob/ally.golem/restore/return_player
    scoreboard players reset $Victim Temporary

# 終了処理
    data modify storage asset:context this.Restored set value true
    kill @s

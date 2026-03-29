#> asset:mob/ally.golem/restore/fatal
#
# ゴーレムが即死した場合の復元&即死亡
#
# @within function asset:mob/ally.golem/hurt/handle

# 復元処理 (即死亡させる)
    execute store result score $Victim Temporary run data get storage asset:context this.VictimUserID
    execute at @s as @a[distance=..150] if score @s UserID = $Victim Temporary run function asset:mob/ally.golem/restore/fatal_apply
    scoreboard players reset $Victim Temporary

# 終了処理
    data modify storage asset:context this.Restored set value true
    kill @s

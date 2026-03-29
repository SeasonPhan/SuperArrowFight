#> asset:mob/ally.golem/hurt/handle
#
# ダメージを受けた際の処理
#
# @within function asset:mob/ally.golem/hurt/

# 体力キャッシュ更新
    function asset:mob/ally.golem/tick/cache_health

# 攻撃者記録
    execute if data storage asset:context Hurt.From store result storage asset:context this.LastAttackerUserID int 1 run data get storage asset:context Hurt.From
    execute as @a[tag=Attacker,limit=1] store result storage asset:context this.LastAttackerUserID int 1 run scoreboard players get @s UserID

# 体力割合
    execute store result score $Prev Temporary run data get storage asset:context this.LastHealthPercent
    execute store result score $Curr Temporary run data get storage asset:context this.HealthPercent
    execute store result score $Threshold Temporary run data get storage asset:context this.ReturnThreshold
    execute if score $Threshold Temporary matches ..0 run scoreboard players set $Threshold Temporary 40

# 即死級ダメージ: 一撃で0%になった場合は即死亡扱い
    execute if score $Curr Temporary matches ..0 if score $Prev Temporary >= $Threshold Temporary run function asset:mob/ally.golem/restore/fatal

# 40%以下になったら解除
    execute unless data storage asset:context this{Restored:true} if score $Curr Temporary matches 1.. if score $Curr Temporary <= $Threshold Temporary run function asset:mob/ally.golem/restore/threshold

# リセット
    scoreboard players reset $Prev Temporary
    scoreboard players reset $Curr Temporary
    scoreboard players reset $Threshold Temporary

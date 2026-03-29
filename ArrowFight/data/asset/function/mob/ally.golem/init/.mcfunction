#> asset:mob/ally.golem/init/
#
# Mobのinit時の処理
#
# @within asset_manager:mob/triggers/init/init.m

# フィールドのチームによって実際のチームを変える
    execute if data storage asset:context this{Team:Blue} run team join Team.Blue
    execute if data storage asset:context this{Team:Red} run team join Team.Red

# 体力設定
    attribute @s max_health base set 40
    data modify entity @s Health set value 40.0f

# 少し大きめにする (1.3倍)
    attribute @s scale base set 0.3

# ゴーレム化タイマー設定 (8秒 = 160tick)
    scoreboard players set @s ally.golem.Timer 160

# 猶予期間 (grace period = 5 tick)
    scoreboard players set @s ally.golem.GraceTicks 5

# VictimUserIDをスコアにコピー
    execute store result score @s ally.golem.VictimLink run data get storage asset:context this.VictimUserID

# チームに属しているので、相手チームのプレイヤーに自動的にaggroする (zombie_bulletと同じ方式)
# そこら辺のやつの方を向く
    rotate @s facing entity @p[distance=..16] feet

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem spawned! Timer=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.Timer"}},{"text":", GraceTicks=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.GraceTicks"}},{"text":", VictimLink=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.VictimLink"}}]

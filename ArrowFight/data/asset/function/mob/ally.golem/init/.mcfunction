#> asset:mob/ally.golem/init/
#
# Mobのinit時の処理
#
# @within asset_manager:mob/triggers/init/init.m

# フィールドのチームによって実際のチームを変える
    execute if data storage asset:context this{Team:Blue} run team join Team.Blue
    execute if data storage asset:context this{Team:Red} run team join Team.Red

# 体力設定 (vanilla iron golem default = 100)
    attribute @s max_health base set 100
    data modify entity @s Health set value 100.0f

# ゴーレム化タイマー設定 (8秒 = 160tick)
    scoreboard players set @s ally.golem.Timer 160

# 猶予期間 (grace period = 5 tick)
    scoreboard players set @s ally.golem.GraceTicks 5

# VictimUserIDをスコアにコピー
    execute store result score @s ally.golem.VictimLink run data get storage asset:context this.VictimUserID

# 最寄りのプレイヤーに対して攻撃対象を設定
    data modify entity @s AngerTime set value 999999
    execute as @p[tag=GameJoinedPlayer,tag=!GolemTransformed,distance=..32] run data modify entity @e[type=iron_golem,tag=this,limit=1] AngryAt set from entity @s UUID

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem spawned! Timer=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.Timer"}},{"text":", GraceTicks=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.GraceTicks"}},{"text":", VictimLink=","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.VictimLink"}}]

#> asset:mob/ally.golem/init/
#
# Mobのinit時の処理
#
# @within asset_manager:mob/triggers/init/init.m

# チーム設定
    execute if data storage asset:context this{Team:Blue} run team join Team.Blue
    execute if data storage asset:context this{Team:Red} run team join Team.Red

# 体力設定
    function asset:mob/ally.golem/init/set_health.m with storage asset:context this

# キャッシュ初期化
    data modify storage asset:context this.HealthPercent set value 100
    data modify storage asset:context this.LastHealthPercent set value 100
    data modify storage asset:context this.LastAttackerUserID set value 0
    data modify storage asset:context this.Restored set value false

# タイマーリセット
    scoreboard players set @s General.Mob.Tick 0

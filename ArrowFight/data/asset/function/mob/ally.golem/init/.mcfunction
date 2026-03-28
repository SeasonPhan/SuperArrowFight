#> asset:mob/ally.golem/init/
#
# Mobのinit時の処理
#
# @within asset_manager:mob/triggers/init/init.m
# asset:context this.Team         = "Red" or "Blue" (from projectile shooter's team)
# asset:context this.VictimUserID = victim player's UserID score (integer)
# asset:context this.ShooterUserID = shooter player's UserID score (for kill attribution)

# AllyGolem タグを付与して外部から識別できるようにする
    tag @s add AllyGolem

# チームによって実際のチームに参加する
    execute if data storage asset:context this{Team:Blue} run team join Team.Blue @s
    execute if data storage asset:context this{Team:Red} run team join Team.Red @s

# 最大体力を設定する (バニラのデフォルト 100 HP = 50♥, 必要に応じてここを変更)
    attribute @s max_health base set 100
    data modify entity @s Health set value 100.0f

# 被害者の UserID をスコアボードに記録してリンクを確立する
    execute store result score @s ally.golem.VictimLink run data get storage asset:context this.VictimUserID 1

# 射手の UserID をスコアボードに記録する (キル帰属に使用; MobField の ShooterUserID にも保存済み)
    execute store result score @s ally.golem.ShooterLink run data get storage asset:context this.ShooterUserID 1

# Tick カウンターを 0 で初期化
    scoreboard players set @s General.Mob.Tick 0

# 周囲の敵の方向を向く
    execute if data storage asset:context this{Team:Red} run rotate @s facing entity @p[team=Team.Blue,distance=..16] feet
    execute if data storage asset:context this{Team:Blue} run rotate @s facing entity @p[team=Team.Red,distance=..16] feet

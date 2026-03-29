#> asset:object/projectile.golem_arrow/hit/apply
#
# ヒット対象をゴーレムに変える
#
# @within function asset:object/projectile.golem_arrow/hit/resolve

# Teamが未設定なら保険で青チームに
    execute unless data storage asset:context this{Team} run data modify storage asset:context this.Team set value Blue
    execute unless data storage asset:context this{DurationTicks} run data modify storage asset:context this.DurationTicks set value 160
    execute unless data storage asset:context this{ReturnThreshold} run data modify storage asset:context this.ReturnThreshold set value 40

# 変身対象のプレイヤー情報をフィールドに渡す
    data modify storage api: Argument.FieldOverride.Team set from storage asset:context this.Team
    execute store result storage api: Argument.FieldOverride.VictimUserID int 1 run scoreboard players get @s UserID
    execute if data storage asset:context this.ShooterUserID store result storage api: Argument.FieldOverride.ShooterUserID int 1 run data get storage asset:context this.ShooterUserID
    execute store result storage api: Argument.FieldOverride.DurationTicks int 1 run data get storage asset:context this.DurationTicks
    execute store result storage api: Argument.FieldOverride.ReturnThreshold int 1 run data get storage asset:context this.ReturnThreshold

# プレイヤーを観戦者にし、タグ付与
    gamemode spectator @s
    tag @s add GolemVictim

# ゴーレム召喚
    function api:mob/summon.m {ID:"ally.golem"}

# クリーンアップ
    data modify storage asset:context this.Resolved set value true
    data remove storage api: Argument.FieldOverride.Team
    data remove storage api: Argument.FieldOverride.VictimUserID
    data remove storage api: Argument.FieldOverride.ShooterUserID
    data remove storage api: Argument.FieldOverride.DurationTicks
    data remove storage api: Argument.FieldOverride.ReturnThreshold

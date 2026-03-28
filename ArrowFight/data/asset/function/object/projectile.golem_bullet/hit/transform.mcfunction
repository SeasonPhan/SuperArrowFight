#> asset:object/projectile.golem_bullet/hit/transform
#
# 命中した被害者プレイヤーをスペクテイターに切り替え、その場にゴーレムを召喚する
#
# @within function asset:object/projectile.golem_bullet/hit/
# @s = 被害者プレイヤー (closest enemy player within AoE)
# execution position = 被害者プレイヤーの座標 (from "at @s" in the hit handler)

# [DEBUG] Confirm transform fired and show target player
    tellraw @a [{"text":"[GolemBullet DEBUG] transform fired! target=","color":"green"},{"selector":"@s","color":"white"}]

# 既にゴーレム変身中の場合はスキップ
    execute if entity @s[tag=GolemVictim] run tellraw @a {"text":"[GolemBullet DEBUG] SKIP: target already has GolemVictim tag","color":"red"}
    execute if entity @s[tag=GolemVictim] run return fail

# 被害者にタグ付与 + 無敵タグ(他の矢に当たらないように)
    tag @s add GolemVictim
    tag @s add PlayerShouldInvulnerable

# スペクテイターモードに切り替え
    gamemode spectator @s
    tellraw @a [{"text":"[GolemBullet DEBUG] set spectator mode on ","color":"green"},{"selector":"@s","color":"white"}]

# ゴーレムの MobField に変換元チームと被害者の UserID を設定する
    data modify storage api: Argument.FieldOverride.Team set from storage asset:context this.Team
    execute store result storage api: Argument.FieldOverride.VictimUserID int 1 run scoreboard players get @s UserID
# キル帰属のため射手の UserID も引き継ぐ
    data modify storage api: Argument.FieldOverride.ShooterUserID set from storage asset:context this.ShooterUserID

# 射手の UserID をプレイヤー自身のスコアに記録する
# (ゴーレムが消えた後でも emergency_restore でキル帰属に利用可能)
    execute store result score @s ally.golem.ShooterLink run data get storage asset:context this.ShooterUserID 1

# ゴーレム召喚 (被害者プレイヤーの座標に)
    tellraw @a {"text":"[GolemBullet DEBUG] calling api:mob/summon.m for ally.golem...","color":"green"}
    function api:mob/summon.m {ID:ally.golem}
    tellraw @a {"text":"[GolemBullet DEBUG] golem summon call returned","color":"green"}

# 演出
    particle minecraft:flash{color:[1.0,1.0,1.0,1.0]} ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.step neutral @a ~ ~ ~ 1 0.8

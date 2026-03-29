#> asset:object/projectile.golem_bullet/hit/transform_player
#
# プレイヤーをゴーレムに変身させる処理
# @s = 変身対象のプレイヤー, 実行位置 = プレイヤーの位置
#
# @within function asset:object/projectile.golem_bullet/hit/*

# 既にゴーレム化されているプレイヤーはスキップ
    execute if entity @s[tag=GolemTransformed] run return fail

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Transforming player ","color":"green"},{"selector":"@s"},{"text":" into golem!","color":"green"}]

# プレイヤーにゴーレム化タグを付与
    tag @s add GolemTransformed

# プレイヤーのUserIDをゴーレムとリンクさせるためにスコアを保存
    scoreboard players operation @s ally.golem.VictimLink = @s UserID

# プレイヤーの現在位置を記録 (復帰用)
    execute store result score @s ally.golem.PosX run data get entity @s Pos[0] 1000
    execute store result score @s ally.golem.PosY run data get entity @s Pos[1] 1000
    execute store result score @s ally.golem.PosZ run data get entity @s Pos[2] 1000

# ゴーレム召喚 - チーム情報を受け渡す
    data modify storage api: Argument.FieldOverride.Team set from storage asset:context this.Team
    execute store result storage api: Argument.FieldOverride.VictimUserID int 1 run scoreboard players get @s UserID
    function api:mob/summon.m {ID:ally.golem}

# プレイヤーをスペクテイターモードに変更
    gamemode spectator @s

# 演出
    playsound minecraft:entity.iron_golem.repair player @a ~ ~ ~ 1 0.8
    particle minecraft:explosion ~ ~1 ~ 0.5 0.5 0.5 0 5 force @a[distance=..64]
    particle minecraft:electric_spark ~ ~1 ~ 0 0 0 1 30 force @a[distance=..64]
    title @s times 0 40 10
    title @s title [{"text":"Golem Form!","color":"gold","bold":true}]
    title @s subtitle [{"text":"You have been transformed!","color":"yellow"}]

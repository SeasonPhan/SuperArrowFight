#> asset:object/projectile.golem_arrow/hit/transform
#
# プレイヤーをゴーレムに変身させる
#
# @within function asset:object/projectile.golem_arrow/hit/

# プレイヤーデータストレージを取得
    function oh_my_dat:please

# 現在の位置を保存
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PosX double 1 run data get entity @s Pos[0] 1
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PosY double 1 run data get entity @s Pos[1] 1
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PosZ double 1 run data get entity @s Pos[2] 1

# 現在の体力を保存
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.Health float 1 run data get entity @s Health 1

# プレイヤーUserIDを保存（ゴーレムに渡すため）
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PlayerUserID int 1 run scoreboard players get @s UserID

# プレイヤー名を保存（ゴーレムに渡すため）
    data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PlayerName set from entity @s CustomName

# ゴーレムを召喚する準備（チームデータを矢から受け渡す）
    execute at @e[type=marker,tag=this,distance=..10,limit=1] run data modify storage api: Argument.FieldOverride.Team set from storage asset:context this.Team

# ゴーレムにプレイヤーUserIDとPlayerNameを渡す
    data modify storage api: Argument.FieldOverride.OwnerUserID set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PlayerUserID
    data modify storage api: Argument.FieldOverride.OwnerName set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.PlayerName

# ゴーレムを召喚
    function api:mob/summon.m {ID:ally.golem}

# プレイヤーをスペクテイターモードに切り替え
    gamemode spectator @s

# 演出
    playsound minecraft:entity.iron_golem.hurt player @s ~ ~ ~ 1 1
    title @s actionbar {"fallback":"You have been transformed into a golem!","translate":"game.super_arrow_fight.golem_transform","color":"yellow"}

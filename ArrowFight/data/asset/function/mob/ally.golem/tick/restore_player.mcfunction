#> asset:mob/ally.golem/tick/restore_player
#
# プレイヤーをゴーレムの位置に戻す
#
# @within function asset:mob/ally.golem/tick/

# プレイヤーを見つける（OwnerUUIDで）
    execute store result score $SearchID Temporary run scoreboard players get @s GolemOwnerID
    execute as @a if score @s UserID = $SearchID Temporary run tag @s add GolemOwner

# プレイヤーを復元（ゴーレムの位置で実行）
    execute if entity @a[tag=GolemOwner,limit=1] as @a[tag=GolemOwner,limit=1] run function asset:mob/ally.golem/tick/restore_player_action

# タグクリーンアップ
    tag @a[tag=GolemOwner] remove GolemOwner
    scoreboard players reset $SearchID Temporary

# ゴーレムを消す
    function api:mob/kill

#> asset:mob/ally.golem/death/
#
# Mobのdeath時の処理
#
# @within asset_manager:mob/triggers/death/death.m

# プレイヤーを見つける（OwnerUUIDで）
    execute store result score $SearchID Temporary run scoreboard players get @s GolemOwnerID
    execute as @a if score @s UserID = $SearchID Temporary run tag @s add GolemOwner

# ゴーレムが即死した場合（50%以上のダメージを一度に受けた）かチェック
    # 最後の体力が50%以上だったかチェック
    execute if score @s GolemLastHealth matches 5000.. if entity @a[tag=GolemOwner,limit=1] as @a[tag=GolemOwner,limit=1] run function asset:mob/ally.golem/death/instant_death

    # 即死でない場合は通常の復元
    execute if score @s GolemLastHealth matches ..4999 if entity @a[tag=GolemOwner,limit=1] as @a[tag=GolemOwner,limit=1] run function asset:mob/ally.golem/death/normal_death

# タグクリーンアップ
    tag @a[tag=GolemOwner] remove GolemOwner
    scoreboard players reset $SearchID Temporary

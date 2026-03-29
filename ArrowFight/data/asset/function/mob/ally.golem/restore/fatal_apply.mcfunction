#> asset:mob/ally.golem/restore/fatal_apply
#
# ゴーレムが即死した場合にプレイヤーを即座にキルする
#
# @within function asset:mob/ally.golem/restore/fatal

# 観戦解除して位置を戻す
    gamemode adventure @s
    tp @s ~ ~ ~
    tag @s remove GolemVictim

# キル実行、攻撃者が分かればクレジットする
    execute if entity @a[tag=Attacker,limit=1] run damage @s 1000 player_attack by @a[tag=Attacker,limit=1]
    execute unless entity @a[tag=Attacker,limit=1] run kill @s

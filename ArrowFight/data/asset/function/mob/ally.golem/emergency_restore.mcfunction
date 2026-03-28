#> asset:mob/ally.golem/emergency_restore
#
# ゴーレムが急死(一撃など)した際の緊急復元処理
# 被害者プレイヤーを現在位置に戻し、即座にキルする
#
# @within function asset:mob/ally.golem/player_check
# @s = GolemVictim タグを持つプレイヤー
#
# 注: ゴーレムが消えているためゴーレムの座標は不明
#     プレイヤーはスペクテイター中の現在位置に戻る
#     キル時の所有者は @s ally.golem.ShooterLink スコアに記録されている

# アドベンチャーモードに戻す
    gamemode adventure @s

# タグをリセット
    tag @s remove PlayerShouldInvulnerable
    tag @s remove GolemVictim

# 演出
    particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1.5 0.7

# 即座にキル (ゴーレムが即死 → 被害者も死亡)
    kill @s

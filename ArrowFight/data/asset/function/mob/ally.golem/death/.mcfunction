#> asset:mob/ally.golem/death/
#
# ゴーレムが死亡した時の処理
# 被害者プレイヤーをゴーレムの座標にテレポートして即座にキルする
#
# @within asset_manager:mob/triggers/death/death.m
# @s = ゴーレムエンティティ (死亡イベント発生時、まだエンティティは存在している)

# VictimLink スコアを一時変数にコピーしてプレイヤーを特定する
    scoreboard players operation $GolemDeathLink Temporary = @s ally.golem.VictimLink

# 被害者プレイヤーをゴーレムの座標にテレポートしてキルする
# (ゴーレムの座標は実行コンテキストの ~ ~ ~ に保持されている)
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemDeathLink Temporary run tp @s ~ ~ ~
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemDeathLink Temporary run gamemode adventure @s
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemDeathLink Temporary run tag @s remove PlayerShouldInvulnerable
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemDeathLink Temporary run tag @s remove GolemVictim

# 演出
    particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1.5 0.7

# 被害者を即座にキルする (ゴーレムが死亡 → 被害者も死亡)
    execute as @a if score @s UserID = $GolemDeathLink Temporary run kill @s

# クリーンアップ
    scoreboard players reset $GolemDeathLink Temporary

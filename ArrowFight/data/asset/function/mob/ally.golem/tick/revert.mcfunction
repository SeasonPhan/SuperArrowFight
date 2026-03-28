#> asset:mob/ally.golem/tick/revert
#
# 変身解除処理: ゴーレムの体力割合を計算してプレイヤーの体力に換算し、被害者を復元する
#
# @within function asset:mob/ally.golem/tick/
# @s = ゴーレムエンティティ

# ゴーレムの体力をプレイヤーの HP に換算する
# プレイヤーHP = (ゴーレム体力 / ゴーレム最大体力) * 20
    execute store result score $GolemRevertHP Temporary run data get entity @s Health
    execute store result score $GolemRevertMax Temporary run attribute @s max_health get
    scoreboard players operation $GolemRevertHP Temporary *= $100 Const
    scoreboard players operation $GolemRevertHP Temporary /= $GolemRevertMax Temporary
    scoreboard players operation $GolemRevertHP Temporary *= $20 Const
    scoreboard players operation $GolemRevertHP Temporary /= $100 Const
# 最低 1 HP を保証する (体力が微小でも生存状態で復元)
    execute if score $GolemRevertHP Temporary matches ..0 run scoreboard players set $GolemRevertHP Temporary 1

# VictimLink スコアを一時変数にコピーしてプレイヤーを特定する
    scoreboard players operation $GolemRevertLink Temporary = @s ally.golem.VictimLink

# 被害者プレイヤーをゴーレムの座標にテレポートして復元する
# ("execute as player" の位置はゴーレムの実行座標を引き継ぐため ~ ~ ~ = ゴーレムの座標)
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemRevertLink Temporary run tp @s ~ ~ ~
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemRevertLink Temporary run gamemode adventure @s
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemRevertLink Temporary store result entity @s Health float 1 run scoreboard players get $GolemRevertHP Temporary
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemRevertLink Temporary run tag @s remove PlayerShouldInvulnerable
    execute as @a[tag=GolemVictim] if score @s UserID = $GolemRevertLink Temporary run tag @s remove GolemVictim

# 演出
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1.2 1

# キル帰属情報: asset:context this.ShooterUserID にキル所有者の UserID が格納されている
# (例: スコアリングシステムへの連携はここから追加可能)

# ゴーレムを消滅させる
    kill @s

# クリーンアップ
    scoreboard players reset $GolemRevertHP Temporary
    scoreboard players reset $GolemRevertMax Temporary
    scoreboard players reset $GolemRevertLink Temporary

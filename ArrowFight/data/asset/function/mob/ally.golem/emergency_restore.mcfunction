#> asset:mob/ally.golem/emergency_restore
#
# ゴーレムが消滅済み(Death handler で処理されなかったケース)の緊急復元処理
# 被害者プレイヤーをゴーレムの最後の座標にテレポートし、即座にキルする
#
# @within function asset:mob/ally.golem/player_check
# @s = GolemVictim タグを持つプレイヤー
#
# 注: ゴーレムの最終座標は ally.golem.PosX/Y/Z スコアに毎tick記録されている

# ゴーレムの最終座標をストレージに転送してテレポートする
    execute store result storage asset:temp GolemPos.X int 1 run scoreboard players get @s ally.golem.PosX
    execute store result storage asset:temp GolemPos.Y int 1 run scoreboard players get @s ally.golem.PosY
    execute store result storage asset:temp GolemPos.Z int 1 run scoreboard players get @s ally.golem.PosZ
    function asset:mob/ally.golem/emergency_tp.m with storage asset:temp GolemPos

# ストレージのクリーンアップ
    data remove storage asset:temp GolemPos

# アドベンチャーモードに戻す
    gamemode adventure @s

# タグをリセット
    tag @s remove PlayerShouldInvulnerable
    tag @s remove GolemVictim

# 演出
    particle minecraft:explosion_emitter ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death neutral @a ~ ~ ~ 1.5 0.7

# 即座にキル (ゴーレムが消滅 → 被害者も死亡)
    kill @s

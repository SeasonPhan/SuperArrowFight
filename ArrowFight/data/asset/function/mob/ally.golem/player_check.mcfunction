#> asset:mob/ally.golem/player_check
#
# GolemVictim タグを持つプレイヤーのゴーレムの状態を確認する
# ゴーレムが消えていたら緊急復元を実行する
#
# @within function core:tick/player/
# @s = GolemVictim タグを持つプレイヤー

# 猶予期間中はチェックをスキップする (変身直後の誤爆防止)
    execute if score @s ally.golem.GraceTicks matches 1.. run scoreboard players remove @s ally.golem.GraceTicks 1
    execute if score @s ally.golem.GraceTicks matches 1.. run return 0

# 自分の UserID を取得する
    scoreboard players operation $GolemCheckUID Temporary = @s UserID

# 自分に対応するゴーレムが存在するか確認する
    scoreboard players set $GolemCheckFound Temporary 0
    execute as @e[type=iron_golem,tag=AllyGolem] if score @s ally.golem.VictimLink = $GolemCheckUID Temporary run scoreboard players set $GolemCheckFound Temporary 1

# ゴーレムが見つからなかった場合 (消滅済み / 即死) → 緊急復元
    execute if score $GolemCheckFound Temporary matches 0 run function asset:mob/ally.golem/emergency_restore

# クリーンアップ
    scoreboard players reset $GolemCheckUID Temporary
    scoreboard players reset $GolemCheckFound Temporary

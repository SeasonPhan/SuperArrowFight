#> world_manager:event/game/end_game/return/
#
# 帰ろう！
#
# @within function world_manager:event/game/end_game/tick

# ゴーレム化されたプレイヤーを元に戻す
    execute if entity @s[tag=GolemTransformed] run tag @s remove GolemTransformed
    execute if entity @s[gamemode=spectator] run gamemode adventure @s

# オブジェクト類をキル
    kill @e[tag=VanishOnExitArena,distance=..128]

# テレポート
    tp @s 500 126 496

# ゲームモード変更
    gamemode adventure

# ロビーモードにする
    function player_manager:mode/lobby

# エフェクト削除
    effect clear @s glowing
    effect clear @s regeneration

# チームリセット
    team leave @s 

# タグ解除
    tag @s remove GameJoinedPlayer

# 荷物削除
    clear @s

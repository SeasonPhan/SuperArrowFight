#> core:handler/rejoin
#
# 二度目以降のJoin時に実行される
#
# @within function core:tick/player/

# 共通Join処理
#    function core:handler/join

# ゲーム参加者だった場合、敗退扱いっていうかロビーに強制送還される
    execute if entity @s[tag=GameJoinedPlayer] run function player_manager:leave_game/send_lobby

# ゴーレム変身中だった場合、タグをリセットしてアドベンチャーモードに戻す
    execute if entity @s[tag=GolemVictim] run gamemode adventure @s
    execute if entity @s[tag=GolemVictim] run tag @s remove PlayerShouldInvulnerable
    execute if entity @s[tag=GolemVictim] run tag @s remove GolemVictim

# Reset
    scoreboard players reset @s RejoinEvent

# TIPS
#    execute if entity @s[tag=TutorialEnded] run function player_manager:show_tips

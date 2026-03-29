#> asset:mob/ally.golem/tick/player_check
#
# ゴーレムの状態チェック - 体力40%以下 or タイマー切れで変身解除
#
# @within function asset:mob/ally.golem/tick/

#> 計算用スコアホルダー
# @private
    #declare score_holder $GolemHealth
    #declare score_holder $GolemMaxHealth
    #declare score_holder $GolemHealthPer

# 現在体力を取得
    execute store result score $GolemHealth Temporary run data get entity @s Health 100
    execute store result score $GolemMaxHealth Temporary run attribute @s max_health get 100

# 体力パーセント計算 (0-100)
    scoreboard players operation $GolemHealthPer Temporary = $GolemHealth Temporary
    scoreboard players operation $GolemHealthPer Temporary *= $100 Const
    scoreboard players operation $GolemHealthPer Temporary /= $GolemMaxHealth Temporary

# デバッグ (10tickごとに表示)
    scoreboard players operation $Temp Temporary = @s ally.golem.Timer
    scoreboard players operation $Temp Temporary %= $10 Const
    execute if score $Temp Temporary matches 0 run tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Golem HP: ","color":"aqua"},{"score":{"name":"$GolemHealthPer","objective":"Temporary"}},{"text":"%, Timer: ","color":"aqua"},{"score":{"name":"@s","objective":"ally.golem.Timer"}}]

# 死亡チェック (HP 0以下) - 即死の場合
    execute if score $GolemHealth Temporary matches ..0 run function asset:mob/ally.golem/tick/emergency_restore
    execute if score $GolemHealth Temporary matches ..0 run return fail

# タイマー切れ or 体力40%以下で変身解除
    execute if score @s ally.golem.Timer matches ..0 run function asset:mob/ally.golem/tick/restore_player
    execute if score @s ally.golem.Timer matches ..0 run return fail
    execute if score $GolemHealthPer Temporary matches ..40 run function asset:mob/ally.golem/tick/restore_player
    execute if score $GolemHealthPer Temporary matches ..40 run return fail

# リセット
    scoreboard players reset $GolemHealth Temporary
    scoreboard players reset $GolemMaxHealth Temporary
    scoreboard players reset $GolemHealthPer Temporary
    scoreboard players reset $Temp Temporary

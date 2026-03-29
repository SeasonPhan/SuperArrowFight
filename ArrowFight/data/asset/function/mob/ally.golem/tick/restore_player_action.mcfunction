#> asset:mob/ally.golem/tick/restore_player_action
#
# プレイヤーを実際に復元する
#
# @within function asset:mob/ally.golem/tick/restore_player

# プレイヤーデータストレージを取得
    function oh_my_dat:please

# ゴーレムの位置にテレポート（thisタグを持つゴーレムの位置へ）
    tp @s @e[tag=this,limit=1,sort=nearest]

# ゲームモードを戻す
    gamemode adventure @s

# 体力をゴーレムの体力パーセンテージに合わせる
    # ゴーレムの現在体力パーセンテージを計算
    execute store result score $GolemHealthPercent Temporary run data get storage api: Return.HealthPer 100

    # プレイヤーの最大体力を取得
    execute store result score $PlayerMaxHealth Temporary run attribute @s max_health get 100

    # プレイヤーに設定する体力を計算（最大体力 × ゴーレム体力％）
    scoreboard players operation $PlayerMaxHealth Temporary *= $GolemHealthPercent Temporary
    scoreboard players operation $PlayerMaxHealth Temporary /= $100 Const

    # 体力を設定（最低1.0にする）
    execute if score $PlayerMaxHealth Temporary matches ..100 run scoreboard players set $PlayerMaxHealth Temporary 100
    execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.NewHealth float 0.01 run scoreboard players get $PlayerMaxHealth Temporary
    data modify entity @s Health set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform.NewHealth

# 演出
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle dust{color:[0.7,0.7,0.7],scale:2} ~ ~1 ~ 0.5 0.5 0.5 1 50 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death player @a ~ ~ ~ 1 1
    title @s actionbar {"fallback":"Transformation ended!","translate":"game.super_arrow_fight.golem_untransform","color":"green"}

# クリーンアップ
    scoreboard players reset $GolemHealthPercent Temporary
    scoreboard players reset $PlayerMaxHealth Temporary
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform

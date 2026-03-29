#> asset:mob/ally.golem/death/normal_death
#
# ゴーレムが通常の死亡をした場合の処理
#
# @within function asset:mob/ally.golem/death/

# プレイヤーデータストレージを取得
    function oh_my_dat:please

# ゴーレムの位置にテレポート
    tp @s @e[tag=this,limit=1,sort=nearest]

# ゲームモードを戻す
    gamemode adventure @s

# 体力を0に設定（瀕死状態）
    data modify entity @s Health set value 1.0f

# 演出
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle dust{color:[0.7,0.7,0.7],scale:2} ~ ~1 ~ 0.5 0.5 0.5 1 50 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death player @a ~ ~ ~ 1 1
    title @s actionbar {"fallback":"Your golem has been destroyed!","translate":"game.super_arrow_fight.golem_destroyed","color":"red"}

# クリーンアップ
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform

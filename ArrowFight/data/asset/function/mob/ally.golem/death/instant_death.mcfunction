#> asset:mob/ally.golem/death/instant_death
#
# ゴーレムが即死した場合の処理
#
# @within function asset:mob/ally.golem/death/

# プレイヤーデータストレージを取得
    function oh_my_dat:please

# ゴーレムの位置にテレポート
    tp @s @e[tag=this,limit=1,sort=nearest]

# ゲームモードを戻す
    gamemode adventure @s

# プレイヤーを即座に倒す
    kill @s

# 演出
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 2 force @a[distance=..64]
    particle dust{color:[1.0,0.0,0.0],scale:2} ~ ~1 ~ 0.5 0.5 0.5 1 50 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.death player @a ~ ~ ~ 1 0.5

# クリーンアップ
    data remove storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].GolemTransform

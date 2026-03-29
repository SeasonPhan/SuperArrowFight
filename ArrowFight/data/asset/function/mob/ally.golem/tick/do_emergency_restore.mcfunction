#> asset:mob/ally.golem/tick/do_emergency_restore
#
# プレイヤーをゴーレム位置に復帰させてからkillする (即死の場合)
# @s = 復帰対象のプレイヤー, 実行位置 = ゴーレムの位置
#
# @within function asset:mob/ally.golem/tick/emergency_restore

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Emergency restoring ","color":"red"},{"selector":"@s"},{"text":" - will be killed!","color":"red"}]

# サバイバルモードに戻す
    gamemode survival @s

# プレイヤーをゴーレムの位置に移動
    tp @s ~ ~ ~ ~ ~

# タグ解除
    tag @s remove GolemTransformed

# プレイヤーをkillする (deathCountを発生させてゲームシステムに死亡を認識させる)
    kill @s

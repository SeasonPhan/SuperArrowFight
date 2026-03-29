#> asset:mob/ally.golem/tick/do_restore
#
# プレイヤーをゴーレム位置に復帰させる (通常の変身解除)
# @s = 復帰対象のプレイヤー, 実行位置 = ゴーレムの位置
#
# @within function asset:mob/ally.golem/tick/restore_player

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Restoring ","color":"green"},{"selector":"@s"},{"text":" to golem position with scaled HP","color":"green"}]

# サバイバルモードに戻す (tp前に変更しないとスペクテイターの位置が使われる可能性)
    gamemode survival @s

# プレイヤーをゴーレムの位置に移動
    tp @s ~ ~ ~ ~ ~

# 体力を設定 (200000 = 20HP × 10000倍, $GolemHealth/$GolemMaxHealth比率で補正, 0.0001で元のHP単位に戻す)
    execute store result entity @s Health float 0.0001 run scoreboard players get $RestoreHealth Temporary

# 最低1HPは保証する
    execute store result score $Temp Temporary run data get entity @s Health 100
    execute if score $Temp Temporary matches ..0 run data modify entity @s Health set value 1.0f

# タグ解除
    tag @s remove GolemTransformed

# 演出
    playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1 1.2
    particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10 force @a[distance=..64]
    title @s times 0 20 10
    title @s title [{"text":"Restored!","color":"green"}]
    title @s subtitle [{"text":"Back to normal form","color":"white"}]

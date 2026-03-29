#> asset:mob/ally.golem/tick/do_restore

# プレイヤーの最大体力を取得して復帰体力を計算 (scale=100)
    execute store result score $PlayerMaxHealth Temporary run attribute @s max_health get 100

# 復帰体力を計算: PlayerMaxHealth * (ally.golem.RestoreHP_as_GolemHealthPer / 10000)
    scoreboard players operation $RestoreHealth Temporary = $PlayerMaxHealth Temporary
    scoreboard players operation $RestoreHealth Temporary *= @s ally.golem.RestoreHP
    scoreboard players set $Scale Temporary 10000
    scoreboard players operation $RestoreHealth Temporary /= $Scale Temporary

# 復帰体力をプレイヤーのスコアに保存 (次tickで適用するため)
    scoreboard players operation @s ally.golem.RestoreHP = $RestoreHealth Temporary

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Restoring ","color":"green"},{"selector":"@s"},{"text":" to golem position with scaled HP=","color":"green"},{"score":{"name":"$RestoreHealth","objective":"Temporary"}}]

# サバイバルモードに戻す
    gamemode survival @s

# プレイヤーをゴーレムの位置に移動
    tp @s ~ ~ ~ ~ ~

# GolemRestoreHP タグを付与 (次tickで体力を適用するためのフラグ)
    tag @s add GolemRestoreHP

# タグ解除
    tag @s remove GolemTransformed

# 演出
    playsound minecraft:entity.iron_golem.repair player @s ~ ~ ~ 1 1.2
    particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10 force @a[distance=..64]
    title @s times 0 20 10
    title @s title [{"text":"Restored!","color":"green"}]
    title @s subtitle [{"text":"Back to normal form","color":"white"}]

#> asset:mob/ally.golem/tick/apply_restore_hp
#
# ゴーレム復帰時の体力を適用する
# プレイヤーのHealth NBTは直接変更できないため、
# まず全回復してから差分ダメージを与える方式を使用
# @s = 復帰対象のプレイヤー
#
# @within function core:tick/player/

# デバッグ
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applying restore HP to ","color":"yellow"},{"selector":"@s"},{"text":", RestoreHP=","color":"yellow"},{"score":{"name":"@s","objective":"ally.golem.RestoreHP"}}]

# 最低1HP(=100スケール)は保証する
    execute if score @s ally.golem.RestoreHP matches ..100 run scoreboard players set @s ally.golem.RestoreHP 100

# まず体力を全回復する (instant_health amplifier 10 = 2048HP回復, 20HPには十分)
    effect give @s minecraft:instant_health 1 10 true

# ダメージ量を計算: (PlayerMaxHealth(×100) - RestoreHP) * 0.01 = 与えるダメージ
# 例: MaxHP=20(×100=2000), RestoreHP=225 → ダメージ = (2000-225) * 0.01 = 17.75
    execute store result score $DamageAmount Temporary run attribute @s max_health get 100
    scoreboard players operation $DamageAmount Temporary -= @s ally.golem.RestoreHP

# ダメージが正の場合のみ適用 (RestoreHP >= 2000 なら全回復のまま)
    execute if score $DamageAmount Temporary matches 1.. run execute store result storage asset:temp DamageAmount float 0.01 run scoreboard players get $DamageAmount Temporary
    execute if score $DamageAmount Temporary matches 1.. run function asset:mob/ally.golem/tick/apply_damage with storage asset:temp

# デバッグ (適用後のHP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applied HP: ","color":"yellow"},{"score":{"name":"$Temp","objective":"Temporary"}}]

# タグとスコアをリセット
    tag @s remove GolemRestoreHP
    scoreboard players reset @s ally.golem.RestoreHP

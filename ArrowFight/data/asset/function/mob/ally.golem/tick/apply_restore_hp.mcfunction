#> asset:mob/ally.golem/tick/apply_restore_hp

# デバッグ
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applying restore HP to ","color":"yellow"},{"selector":"@s"},{"text":", RestoreHP=","color":"yellow"},{"score":{"name":"@s","objective":"ally.golem.RestoreHP"}}]

# プレイヤーの実際の最大体力を取得 (scale 100)
    execute store result score $PlayerMaxHealth Temporary run attribute @s max_health get 100

# 最低1HP(=100スケール)は保証する
    execute if score @s ally.golem.RestoreHP matches ..100 run scoreboard players set @s ally.golem.RestoreHP 100

# 目標体力が実際の最大体力を超えないようにクランプする
    scoreboard players operation @s ally.golem.RestoreHP < $PlayerMaxHealth Temporary

# まず体力を全回復する (instant_health amplifier 10 = 2048HP回復)
    effect give @s minecraft:instant_health 1 10 true

# 継続回復を防ぐため、即座にエフェクトをクリアする (超重要)
    effect clear @s minecraft:instant_health

# ダメージ量を計算: (PlayerMaxHealth - RestoreHP) * 0.01 = 与えるダメージ
    scoreboard players operation $DamageAmount Temporary = $PlayerMaxHealth Temporary
    scoreboard players operation $DamageAmount Temporary -= @s ally.golem.RestoreHP

# ダメージをストレージに保存 (float, scale 0.01)
    execute store result storage asset:temp DamageAmount float 0.01 run scoreboard players get $DamageAmount Temporary

# ダメージが正の場合のみ適用
    execute if score $DamageAmount Temporary matches 1.. run function asset:mob/ally.golem/tick/apply_damage with storage asset:temp

# デバッグ (適用後のHP確認)
    execute store result score $Temp Temporary run data get entity @s Health 100
    #tellraw @a [{"text":"[DEBUG] ","color":"gray"},{"text":"Applied HP: ","color":"yellow"},{"score":{"name":"$Temp","objective":"Temporary"}},{"text":"/","color":"yellow"},{"score":{"name":"$PlayerMaxHealth","objective":"Temporary"}}]

# タグとスコアをリセット
    tag @s remove GolemRestoreHP
    scoreboard players reset @s ally.golem.RestoreHP

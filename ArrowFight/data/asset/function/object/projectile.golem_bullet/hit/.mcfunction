#> asset:object/projectile.golem_bullet/hit/
#
# 継承先などから実行される処理
#
# @within asset_manager:object/call_method/run_method.m

# [DEBUG] Confirm hit fired and show Team value stored in context
    tellraw @a [{"text":"[GolemBullet DEBUG] hit/ fired. Team=","color":"yellow"},{"storage":"asset:context","nbt":"this.Team","color":"white"}]
    execute unless data storage asset:context this.Team run tellraw @a {"text":"[GolemBullet DEBUG] ERROR: this.Team is missing from context!","color":"red"}

# 演出
    playsound minecraft:entity.iron_golem.hurt neutral @a ~ ~ ~ 1.5 0.8
    playsound minecraft:entity.generic.explode neutral @a ~ ~ ~ 0.8 1.3
    particle minecraft:flash ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle minecraft:smoke ~ ~1 ~ 0.3 0.3 0.3 0.05 20 force @a[distance=..64]
    particle minecraft:crit ~ ~1 ~ 0.3 0.3 0.3 0.1 30 force @a[distance=..64]

# 範囲内の最も近い敵プレイヤー(1人)をゴーレムに変える
    # 赤チームが発射 → 青チームの最近接プレイヤーを対象にする
        execute if data storage asset:context this{Team:Red} run tellraw @a {"text":"[GolemBullet DEBUG] Team=Red: searching for Team.Blue enemy within 5r...","color":"yellow"}
        execute if data storage asset:context this{Team:Red} store result score $GBDebugCount Temporary if entity @a[team=Team.Blue,distance=..5] run tellraw @a [{"text":"[GolemBullet DEBUG] Team.Blue players in 5r: ","color":"yellow"},{"score":{"name":"$GBDebugCount","objective":"Temporary"},"color":"white"}]
        execute if data storage asset:context this{Team:Red} as @p[team=Team.Blue,distance=..5] at @s run function asset:object/projectile.golem_bullet/hit/transform
    # 青チームが発射 → 赤チームの最近接プレイヤーを対象にする
        execute if data storage asset:context this{Team:Blue} run tellraw @a {"text":"[GolemBullet DEBUG] Team=Blue: searching for Team.Red enemy within 5r...","color":"yellow"}
        execute if data storage asset:context this{Team:Blue} store result score $GBDebugCount Temporary if entity @a[team=Team.Red,distance=..5] run tellraw @a [{"text":"[GolemBullet DEBUG] Team.Red players in 5r: ","color":"yellow"},{"score":{"name":"$GBDebugCount","objective":"Temporary"},"color":"white"}]
        execute if data storage asset:context this{Team:Blue} as @p[team=Team.Red,distance=..5] at @s run function asset:object/projectile.golem_bullet/hit/transform

# Super
    function asset:object/super.method

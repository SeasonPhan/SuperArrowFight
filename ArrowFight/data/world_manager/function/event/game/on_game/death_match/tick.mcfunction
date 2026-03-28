#> world_manager:event/game/on_game/death_match/tick
#
# デスマッチ処理
#
# @within function world_manager:event/game/on_game/tick

# 開幕
    execute if score $Game Game.Tick matches 9000 run tellraw @a [{"color":"gold","text":"! "},{"color":"yellow","text":"Halfway to Death Match (7:30 remaining)"},{"color":"gold","text":" !"}]
    execute if score $Game Game.Tick matches 14400 run tellraw @a [{"color":"gold","text":"! "},{"color":"red","text":"Death Match in 3:00"},{"color":"gold","text":" !"}]
    execute if score $Game Game.Tick matches 18000 run function world_manager:event/game/on_game/death_match/start

# 島が消えていく…
    # 予告
        execute if score $Game Game.Tick matches 18000 run execute positioned ~ 100 ~ positioned ~ ~ ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 18200 run execute positioned ~ 100 ~ positioned ~ ~1 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 18400 run execute positioned ~ 100 ~ positioned ~ ~2 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 18600 run execute positioned ~ 100 ~ positioned ~ ~3 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 18800 run execute positioned ~ 100 ~ positioned ~ ~4 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 19000 run execute positioned ~ 100 ~ positioned ~ ~5 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 19200 run execute positioned ~ 100 ~ positioned ~ ~6 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 19400 run execute positioned ~ 100 ~ positioned ~ ~7 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 19600 run execute positioned ~ 100 ~ positioned ~ ~8 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 19800 run execute positioned ~ 100 ~ positioned ~ ~9 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 20000 run execute positioned ~ 100 ~ positioned ~ ~10 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 20200 run execute positioned ~ 100 ~ positioned ~ ~11 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 20400 run execute positioned ~ 100 ~ positioned ~ ~12 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 20600 run execute positioned ~ 100 ~ positioned ~ ~13 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 20800 run execute positioned ~ 100 ~ positioned ~ ~14 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 21000 run execute positioned ~ 100 ~ positioned ~ ~15 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 21200 run execute positioned ~ 100 ~ positioned ~ ~16 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 21400 run execute positioned ~ 100 ~ positioned ~ ~17 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 21600 run execute positioned ~ 100 ~ positioned ~ ~18 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 21800 run execute positioned ~ 100 ~ positioned ~ ~19 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 22000 run execute positioned ~ 100 ~ positioned ~ ~20 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 22200 run execute positioned ~ 100 ~ positioned ~ ~21 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 22400 run execute positioned ~ 100 ~ positioned ~ ~22 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 22600 run execute positioned ~ 100 ~ positioned ~ ~23 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 22800 run execute positioned ~ 100 ~ positioned ~ ~24 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 23000 run execute positioned ~ 100 ~ positioned ~ ~25 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 23200 run execute positioned ~ 100 ~ positioned ~ ~26 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 23400 run execute positioned ~ 100 ~ positioned ~ ~27 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 23600 run execute positioned ~ 100 ~ positioned ~ ~28 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
        execute if score $Game Game.Tick matches 23800 run execute positioned ~ 100 ~ positioned ~ ~29 ~ run fill 530 ~ 580 470 ~ 534 sculk replace #lib:deathmatch_replaceable
    # 溶岩
        execute if score $Game Game.Tick matches 18200 run execute positioned ~ 100 ~ positioned ~ ~0 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 18400 run execute positioned ~ 100 ~ positioned ~ ~1 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 18600 run execute positioned ~ 100 ~ positioned ~ ~2 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 18800 run execute positioned ~ 100 ~ positioned ~ ~3 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 19000 run execute positioned ~ 100 ~ positioned ~ ~4 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 19200 run execute positioned ~ 100 ~ positioned ~ ~5 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 19400 run execute positioned ~ 100 ~ positioned ~ ~6 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 19600 run execute positioned ~ 100 ~ positioned ~ ~7 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 19800 run execute positioned ~ 100 ~ positioned ~ ~8 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 20000 run execute positioned ~ 100 ~ positioned ~ ~9 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 20200 run execute positioned ~ 100 ~ positioned ~ ~10 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 20400 run execute positioned ~ 100 ~ positioned ~ ~11 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 20600 run execute positioned ~ 100 ~ positioned ~ ~12 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 20800 run execute positioned ~ 100 ~ positioned ~ ~13 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 21000 run execute positioned ~ 100 ~ positioned ~ ~14 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 21200 run execute positioned ~ 100 ~ positioned ~ ~15 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 21400 run execute positioned ~ 100 ~ positioned ~ ~16 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 21600 run execute positioned ~ 100 ~ positioned ~ ~17 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 21800 run execute positioned ~ 100 ~ positioned ~ ~18 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 22000 run execute positioned ~ 100 ~ positioned ~ ~19 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 22200 run execute positioned ~ 100 ~ positioned ~ ~20 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 22400 run execute positioned ~ 100 ~ positioned ~ ~21 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 22600 run execute positioned ~ 100 ~ positioned ~ ~22 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 22800 run execute positioned ~ 100 ~ positioned ~ ~23 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 23000 run execute positioned ~ 100 ~ positioned ~ ~24 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 23200 run execute positioned ~ 100 ~ positioned ~ ~25 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 23400 run execute positioned ~ 100 ~ positioned ~ ~26 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 23600 run execute positioned ~ 100 ~ positioned ~ ~27 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 23800 run execute positioned ~ 100 ~ positioned ~ ~28 ~ run fill 530 ~ 580 470 ~ 534 air
        execute if score $Game Game.Tick matches 24000 run execute positioned ~ 100 ~ positioned ~ ~29 ~ run fill 530 ~ 580 470 ~ 534 air

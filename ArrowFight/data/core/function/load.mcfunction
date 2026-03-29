#> core:load
#
# ロード処理
#
# @within tag/function minecraft:load

# 初期ロード
    execute unless data storage world_manager: Game{Init:true} run function core:load_init/

# ゴーレム弾関連スコアボード (load_initは初回のみ実行されるため、reload時にも確実に作成する)
    scoreboard objectives add ally.golem.VictimLink dummy {"text":"Golem Victim Link"}
    scoreboard objectives add ally.golem.Timer dummy {"text":"Golem Transform Timer"}
    scoreboard objectives add ally.golem.GraceTicks dummy {"text":"Golem Grace Period"}
    scoreboard objectives add ally.golem.PosX dummy {"text":"Golem Victim PosX"}
    scoreboard objectives add ally.golem.PosY dummy {"text":"Golem Victim PosY"}
    scoreboard objectives add ally.golem.PosZ dummy {"text":"Golem Victim PosZ"}

# その他初期化が必要なもの
    function #asset:item/load
    function #asset:object/load

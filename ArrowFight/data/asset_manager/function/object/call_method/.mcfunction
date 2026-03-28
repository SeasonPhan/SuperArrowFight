#> asset_manager:object/call_method/
#
#
#
# @within function
#   asset:object/call.m
#   asset_manager:object/call_method/call_super_methods/foreach

# [DEBUG] Confirm call_method/ is running and show id/method
    tellraw @a [{"text":"[call_method DEBUG] running. id=","color":"gold"},{"storage":"asset:context","nbt":"id","color":"white"},{"text":" method=","color":"gold"},{"storage":"asset:context","nbt":"method","color":"white"}]

# メソッドの実行
    function asset_manager:object/call_method/run_method.m with storage asset:context

# [DEBUG] Show Implement after run_method.m
    tellraw @a [{"text":"[call_method DEBUG] after run_method. Implement=","color":"gold"},{"storage":"asset:object","nbt":"Implement","color":"white"}]

# super.summon呼び出し
    execute unless data storage asset:object {Implement:true} run function asset_manager:object/call_method/call_super_methods/

#> asset_manager:object/call_method/run_method.m
#
#
#
# @within function asset_manager:object/call_method/

# [DEBUG] Confirm run_method.m is reached and show id/method
$tellraw @a [{"text":"[run_method DEBUG] id=$(id) method=$(method) → calling function","color":"dark_green"}]

$function asset:object/$(id)/$(method)/
$execute store success storage asset:object Implement byte 1 run schedule function asset:object/$(id)/$(method)/ 2147483647t
$schedule clear asset:object/$(id)/$(method)/

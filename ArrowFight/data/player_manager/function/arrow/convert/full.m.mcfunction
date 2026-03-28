#> player_manager:arrow/convert/full.m
#
# 完全に別オブジェクトとして放つ。
#
# @within function player_manager:arrow/convert/

# [DEBUG] Confirm full.m ran and show object ID being summoned
    $tellraw @a [{"text":"[FullConvert DEBUG] full.m fired! ObjectID=","color":"aqua"},{"text":"$(ObjectID)","color":"white"}]

# オブジェクトを召喚
    data modify storage api: Argument.FieldOverride.IsConvertFromArrow set value true
    $execute on origin rotated as @s run function api:object/summon.m {ID:$(ObjectID)}
    tellraw @a {"text":"[FullConvert DEBUG] summon call returned. Killing arrow now.","color":"aqua"}
    
# 消滅
    kill @s

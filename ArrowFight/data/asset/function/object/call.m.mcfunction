#> asset:object/call.m
#
#
#
# @within function asset:object/*/**

# [DEBUG] Show originID and method argument when call.m fires
    tellraw @a [{"text":"[call.m DEBUG] fired. originID=","color":"light_purple"},{"storage":"asset:context","nbt":"originID","color":"white"}]

# 既存のasset:context idを退避させる
    function asset_manager:common/context/id/stash
# 既存のasset:context methodを退避させる
    function asset_manager:common/context/method/stash

# OriginID取得
    data modify storage asset:context id set from storage asset:context originID

# Methodの取得
    $data modify storage asset:context method set value $(method)

# [DEBUG] Show id and method just before dispatch
    tellraw @a [{"text":"[call.m DEBUG] dispatching → id=","color":"light_purple"},{"storage":"asset:context","nbt":"id","color":"white"},{"text":" method=","color":"light_purple"},{"storage":"asset:context","nbt":"method","color":"white"}]

# メソッドの呼び出し
    function asset_manager:object/call_method/

# 退避させたasset:context idを戻す
    function asset_manager:common/context/id/pop
# 退避させたasset:context methodを戻す
    function asset_manager:common/context/method/pop

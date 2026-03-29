#> asset:object/projectile.golem_arrow/hit/
#
# 継承先などから実行される処理
#
# @within asset_manager:object/call_method/run_method.m

# 最初の1回だけ処理する
    execute unless data storage asset:context this{Resolved:true} run function asset:object/projectile.golem_arrow/hit/resolve

# 処理が終わったら消滅
    execute if data storage asset:context this{Resolved:true} run kill @s

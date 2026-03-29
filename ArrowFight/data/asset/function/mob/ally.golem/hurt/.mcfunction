#> asset:mob/ally.golem/hurt/
#
# Mobのhurt時の処理
#
# @within asset_manager:mob/triggers/hurt/hurt.m

execute unless data storage asset:context this{Restored:true} run function asset:mob/ally.golem/hurt/handle

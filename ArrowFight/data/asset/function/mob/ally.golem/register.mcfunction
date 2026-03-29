#> asset:mob/ally.golem/register
#
# Mobのデータを指定
#
# @within function asset_manager:mob/summon/register.m

# 継承されることを前提とした、抽象的なモブであるかどうか(boolean)
    data modify storage asset:mob IsAbstract set value false
# ID (int)
    data modify storage asset:mob ID set value "ally.golem"
# フィールド
    data modify storage asset:mob Field.VictimUserID set value 0
    data modify storage asset:mob Field.Team set value "none"

#> asset:mob/ally.golem/register
#
# Mobのデータを指定
#
# @within function asset_manager:mob/summon/register.m

# 継承(オプション)
    # data modify storage asset:mob Extends append value 
    # function asset:mob/_extends
# 他のモブに継承されることを許可するか (boolean) (オプション)
    # data modify storage asset:mob ExtendsSafe set value 
# 継承されることを前提とした、抽象的なモブであるかどうか(boolean)
    data modify storage asset:mob IsAbstract set value false
# ID
    data modify storage asset:mob ID set value "ally.golem"
# フィールド
    data modify storage asset:mob Field.Team set value "Blue"
    data modify storage asset:mob Field.VictimUserID set value 0
    data modify storage asset:mob Field.ShooterUserID set value 0
    data modify storage asset:mob Field.DurationTicks set value 160
    data modify storage asset:mob Field.ReturnThreshold set value 40
    data modify storage asset:mob Field.MaxHealth set value 100

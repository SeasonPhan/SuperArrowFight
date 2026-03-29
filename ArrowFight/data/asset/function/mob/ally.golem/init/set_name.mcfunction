#> asset:mob/ally.golem/init/set_name
#
# プレイヤー名をゴーレムに設定（マクロで）
#
# @within function asset:mob/ally.golem/init/

$data modify entity @s CustomName set value '{"text":"","extra":[$(OwnerName),{"text":" (Golem)","color":"$(color)"}]}'
data modify entity @s CustomNameVisible set value 1b

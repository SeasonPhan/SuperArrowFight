#> asset:mob/ally.golem/tick/apply_max_health
#
# マクロ関数: max_healthを一時的に復帰HPに設定する
# max_healthを下げることで、現在のHPがクランプ(制限)される
# @s = プレイヤー
#
# @within function asset:mob/ally.golem/tick/apply_restore_hp

$attribute @s max_health base set $(RestoreHP)

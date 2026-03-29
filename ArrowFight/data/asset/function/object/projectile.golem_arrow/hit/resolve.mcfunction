#> asset:object/projectile.golem_arrow/hit/resolve
#
# 着弾時のプレイヤー判定を行う
#
# @within function asset:object/projectile.golem_arrow/hit/

# 直撃判定
    execute at @s as @a[gamemode=!spectator,tag=!GolemVictim,distance=..1.5,sort=nearest,limit=1] run function asset:object/projectile.golem_arrow/hit/apply

# 地面ヒット時の近傍サーチ
    execute unless data storage asset:context this{Resolved:true} at @s as @a[gamemode=!spectator,tag=!GolemVictim,distance=..5,sort=nearest,limit=1] run function asset:object/projectile.golem_arrow/hit/apply

# 対象不在でも終了させる
    execute unless data storage asset:context this{Resolved:true} run data modify storage asset:context this.Resolved set value true

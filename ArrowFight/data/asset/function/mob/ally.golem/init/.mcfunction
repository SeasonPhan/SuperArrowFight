#> asset:mob/ally.golem/init/
#
# Mobのinit時の処理
#
# @within asset_manager:mob/triggers/init/init.m

# フィールドのチームによって実際のチームを変える
    execute if data storage asset:context this{Team:Blue} run team join Team.Blue
    execute if data storage asset:context this{Team:Red} run team join Team.Red

# プレイヤー名をゴーレムに設定（チームの色で）
    execute if data storage asset:context this{Team:Blue} run data modify storage asset:context NameData set value {color:"dark_aqua"}
    execute if data storage asset:context this{Team:Red} run data modify storage asset:context NameData set value {color:"dark_red"}
    data modify storage asset:context NameData.OwnerName set from storage asset:context this.OwnerName
    function asset:mob/ally.golem/init/set_name with storage asset:context NameData

# 体力設定（バニラのアイアンゴーレムの体力は100）
    attribute @s max_health base set 100
    data modify entity @s Health set value 100.0f

# タイマーを初期化（8秒 = 160 tick）
    scoreboard players set @s GolemTimer 160

# プレイヤーUserIDをエンティティに記録
    execute store result score @s GolemOwnerID run data get storage asset:context this.OwnerUserID

# 演出
    particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1 force @a[distance=..64]
    particle dust{color:[0.7,0.7,0.7],scale:2} ~ ~1 ~ 0.5 0.5 0.5 1 50 force @a[distance=..64]
    playsound minecraft:entity.iron_golem.hurt player @a ~ ~ ~ 1 1

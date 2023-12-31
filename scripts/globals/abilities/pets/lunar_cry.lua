---------------------------------------------
-- Lunar Cry (Fenrir Blood Pact)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/summon")
require("scripts/globals/msg")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)
    local moon = VanadielMoonPhase()
	local petlvl = pet:getMainLvl()
    local buffvalue = 0
	local contrabuff = 32 -- Retail value 32
	local buffmultiplier = 1
	
    if moon > 90 then
        buffvalue = 31
    elseif moon > 75 then
        buffvalue = 26
    elseif moon > 60 then
        buffvalue = 21
    elseif moon > 40 then
        buffvalue = 16
    elseif moon > 25 then
        buffvalue = 11
    elseif moon > 10 then
        buffvalue = 6
    else
        buffvalue = 1
    end
	
	if (petlvl > 99) then
		buffmultiplier = 4
	elseif (petlvl <= 90) then
		buffmultiplier = 3
	elseif (petlvl <= 75) then
		buffmultiplier = 2
	elseif (petlvl <= 55) then
		buffmultiplier = 1
	end
	
	buffvalue = buffvalue * buffmultiplier
	contrabuff = contrabuff * buffmultiplier
	
--	printf("lunar_cry.lua onPetAbility Moon Phase: [%i]  BuffValue: [%i]  ContraBuff: [%i]", moon, buffvalue, contrabuff)
	
    target:delStatusEffect(tpz.effect.ACCURACY_DOWN)
    target:delStatusEffect(tpz.effect.EVASION_DOWN)
    target:addStatusEffect(tpz.effect.ACCURACY_DOWN, buffvalue, 0, 180)
    target:addStatusEffect(tpz.effect.EVASION_DOWN, contrabuff - buffvalue, 0, 180)
    skill:setMsg(tpz.msg.basic.NONE)
    return 0
end
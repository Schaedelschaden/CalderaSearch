---------------------------------------------
-- Ecliptic Howl (Fenrir Blood Pact)
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

function onPetAbility(target, pet, skill, player)
    local bonusTime = utils.clamp(player:getSkillLevel(tpz.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 180 + bonusTime
	local petlvl = pet:getMainLvl()
	local buffvalue = 0
	local contrabuff = 50 -- Retail value 25
	local buffmultiplier = 1
    local moon = VanadielMoonPhase()

    if moon > 90 then
        buffvalue = 50 -- Retail value 25
    elseif moon > 75 then
        buffvalue = 42 -- Retail value 21
    elseif moon > 60 then
        buffvalue = 34 -- Retail value 17
    elseif moon > 40 then
        buffvalue = 26 -- Retail value 13
    elseif moon > 25 then
        buffvalue = 18 -- Retail value 9
    elseif moon > 10 then
        buffvalue = 10 -- Retail value 5
    else
        buffvalue = 2 -- Retail value 1
    end
	
	if (petlvl > 99) then
		buffmultiplier = 4
	elseif (petlvl <= 99) then
		buffmultiplier = 3
	elseif (petlvl <= 80) then
		buffmultiplier = 2
	elseif (petlvl <= 65) then
		buffmultiplier = 1
	end
	
	buffvalue = buffvalue * buffmultiplier
	contrabuff = contrabuff * buffmultiplier
	
    target:delStatusEffect(tpz.effect.ACCURACY_BOOST)
    target:delStatusEffect(tpz.effect.EVASION_BOOST)
    target:addStatusEffect(tpz.effect.ACCURACY_BOOST,buffvalue,0,duration)
    target:addStatusEffect(tpz.effect.EVASION_BOOST,contrabuff-buffvalue,0,duration)
    skill:setMsg(tpz.msg.basic.NONE)
	
    return 0
end
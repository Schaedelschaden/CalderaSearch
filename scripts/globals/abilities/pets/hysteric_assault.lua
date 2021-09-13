---------------------------------------------
-- Hysteric Assault (Siren Blood Pact)
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
	local animationID = 185
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
    local numhits = 3
    local accmod = 1
    local dmgmod = 8
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, 0, TP_NO_EFFECT)
	
    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    target:updateEnmityFromDamage(pet, totaldamage)
	
	pet:addHP(totaldamage)
	
	pet:PrintToArea(string.format("Hysteric Assault drains %i HP from the %s.", totaldamage, fixedMobName),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
	-- player:PrintToPlayer(string.format("%i HP drained from the %s.", totaldamage, fixedMobName),tpz.msg.channel.NS_SAY)
	-- printf("hysteric_assault.lua onPetAbility DAMAGE: [%i]  MOB: [%s]", totaldamage, fixedMobName)
	
	PlayPetAnimation(pet, target, 13, animationID)
	
	skill:setMsg(tpz.msg.basic.SKILL_DRAIN_HP)

    return totaldamage
end
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
    local dmgmod = 10
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, 0, TP_NO_EFFECT)
	
    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.PIERCING)
    target:updateEnmityFromDamage(pet, totaldamage)
	
	pet:addHP(totaldamage)
	
	player:PrintToPlayer(string.format("%i HP drained from the %s.", totaldamage, fixedMobName),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return totaldamage
end
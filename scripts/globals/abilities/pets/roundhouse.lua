---------------------------------------------
-- Roundhouse (Siren Blood Pact)
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
	local animationID = 179
	local mobName = target:getName()
	local fixedMobName = string.gsub(mobName, "_", " ")
    local numhits = 1
    local accmod = 1
    local dmgmod = 4.5
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, 0, TP_NO_EFFECT)
	
    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, totaldamage)
	
	player:PrintToPlayer(string.format("The %s takes %i points of damage.", fixedMobName, totaldamage),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return totaldamage
end
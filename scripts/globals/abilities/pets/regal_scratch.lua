---------------------------------------------
-- Regal Scratch (Cait Sith Blood Pact)
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
    local animationID = 161
	local mobName = target:getName()
	local fixedName = string.gsub(mobName, "_", " ")
	local numhits = 3
    local accmod = 1
    local dmgmod = 1
    local dmgmodsubsequent = 1

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, dmgmodsubsequent, TP_NO_EFFECT, 1, 2, 3)
    totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING, numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    target:updateEnmityFromDamage(pet, totaldamage)
	
	player:PrintToArea(string.format("The %s takes %i points of damage.", fixedName, totaldamage),tpz.msg.channel.NS_SAY, tpz.msg.area.SAY)
	-- player:PrintToPlayer(string.format("The %s takes %i damage.", fixedMobName, totaldamage),tpz.msg.channel.NS_SAY)
	
	PlayPetAnimation(pet, target, 13, animationID)

    return totaldamage
end
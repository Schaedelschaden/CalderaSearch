---------------------------------------------
-- Blindside (Diabolos Blood Pact)
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
	local numhits = 2
    local accmod = 1
    local dmgmod = 9
    local totaldamage = 0
	
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.SLASHING,numhits)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.SLASHING)
    target:updateEnmityFromDamage(pet,totaldamage)

    return totaldamage
end
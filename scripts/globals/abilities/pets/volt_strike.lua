---------------------------------------------
-- Volt Strike (Ramuh Blood Pact)
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
    local numhits = 3
    local accmod = 1
    local dmgmod = 8
    local dmgmodsubsequent = 2
    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_CRIT_VARIES,0.5,0.75,1)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,tpz.attackType.PHYSICAL,tpz.damageType.BLUNT,numhits)
    target:addStatusEffect(tpz.effect.STUN, 1, 0, 15)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(pet,totaldamage)
    return totaldamage
end
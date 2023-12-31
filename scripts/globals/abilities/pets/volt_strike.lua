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
    local numhits     = 3
    local accmod      = 1
    local dmgmod      = 3
    local dmgmodsub   = 2
    local damage      = AvatarPhysicalMove(pet, target, skill, numhits, accmod, dmgmod, dmgmodsub, TP_CRIT_VARIES, 35, 60, 75)
    local totaldamage = AvatarFinalAdjustments(damage.dmg, pet, skill, target, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT, numhits)
	
	local resist = math.random()
--    printf("volt_strike.lua onPetAbility RESIST: [%f]", resist)
	
	target:addStatusEffect(tpz.effect.STUN, 1, 0, 15 * resist)
    target:takeDamage(totaldamage, pet, tpz.attackType.PHYSICAL, tpz.damageType.BLUNT)
    target:updateEnmityFromDamage(pet, totaldamage)

    return totaldamage
end

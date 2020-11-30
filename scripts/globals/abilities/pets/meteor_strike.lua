---------------------------------------------
-- Meteor Strike (Ifrit Blood Pact)
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
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local tp = skill:getTP() / 10
    local merits = player:getMerit(tpz.merit.METEOR_STRIKE)

    tp = tp + (merits - 40)

    --note: this formula is only accurate for level 75 - 76+ may have a different intercept and/or slope
    local petLvl = pet:getMainLvl()
	local dmgscale = petLvl * 8 -- Caps at +968 damage for level 121
	
	local damage = math.floor(dmgscale + 3.21*(tp+1))
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.FIRE,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.FIRE)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.FIRE,1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end
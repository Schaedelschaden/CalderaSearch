---------------------------------------------
-- Night Terror (Diabolos Blood Pact)
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
    local damage = 939
	
	if (target:hasStatusEffect(tpz.effect.SLEEP_I)) or (target:hasStatusEffect(tpz.effect.SLEEP_II)) then
		damage = damage * 1.4 -- 40% damage increase against slept targets
	end
	
    damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.DARK,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.DARK,1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end
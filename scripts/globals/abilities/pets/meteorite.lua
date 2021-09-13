---------------------------------------------
-- Meteorite (Carbuncle Blood Pact)
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)
--	printf("Meteorite PET onPetAbility\n")
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
	local tp = skill:getTP()

	local damage = 975
	damage = damage + (dINT * 1.5)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHT,1,TP_DMG_BONUS, 1, 2, 3)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHT)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHT,1)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHT)
	target:updateEnmityFromDamage(pet,damage)
	
    return damage
end
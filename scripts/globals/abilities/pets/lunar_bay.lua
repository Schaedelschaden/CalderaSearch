---------------------------------------------
-- Lunar Bay (Fenrir Blood Pact)
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
--	printf("Lunar Bay PET onPetAbility\n")
	local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
	local tp = skill:getTP()
	local damage = math.floor(900 + 0.025*(tp))

	printf("lunar_bay.lua onPetAbility DAMAGE 1: [%i]", damage)

	damage = damage + (dINT * 1.5)
	printf("lunar_bay.lua onPetAbility DAMAGE 2: [%i]", damage)
	damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.DARK,1,TP_DMG_BONUS,1)
	printf("lunar_bay.lua onPetAbility DAMAGE 3: [%i]", damage.dmg)
	damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
	printf("lunar_bay.lua onPetAbility DAMAGE 4: [%i]", damage)
	damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.DARK,1)
	printf("lunar_bay.lua onPetAbility DAMAGE 5: [%i]", damage)

	target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
	target:updateEnmityFromDamage(pet,damage)

	return damage
end
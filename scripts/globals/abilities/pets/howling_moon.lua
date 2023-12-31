---------------------------------------------------
-- Howling Moon
---------------------------------------------------
require("/scripts/globals/settings")
require("/scripts/globals/status")
require("/scripts/globals/monstertpmoves")
require("/scripts/globals/magic")
---------------------------------------------------

function onAbilityCheck(player, target, ability)
	return 0,0
end

function onPetAbility(target, pet, skill)	
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet, target, skill, damage, tpz.magic.ele.DARK, 1, TP_NO_EFFECT, 0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.DARK)
    damage = AvatarFinalAdjustments(damage, pet, skill, target, tpz.attackType.MAGICAL, tpz.damageType.DARK, 1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.DARK)
    target:updateEnmityFromDamage(pet, damage)

    return damage
end